import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Types/types.dart';
import 'widget/message_widget.dart';
import 'package:flutter_training/message/debug_message_provider.dart';
import 'package:flutter_training/user/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../message/debug_message.dart';

// I have to determine Uri as local IP (not working as localhost:3000)
const _mockedHttpUri = 'http://192.168.1.26:3000';

class DebugChatPage extends HookConsumerWidget {
  DebugChatPage({super.key});

  late final IO.Socket socket;

  void connect() {
    socket = IO.io(
        _mockedHttpUri,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
  }

  void sendMessage(
      {required String message,
      required String sender,
      required WidgetRef ref}) {
    final msg = DebugMessage(
        type: MessageUserType.ownMsg.messageTypeName,
        message: message,
        sender: sender);
    socket.emit(EmitEventType.sendMsg.eventName,
        {'type': 'ownMsg', 'msg': msg.message, 'sender': sender});
  }

  List<MessageWidget> makeMessageWidget(
      {required List<DebugMessage> debugMessages}) {
    List<MessageWidget> retList = [];
    for (var it in debugMessages) {
      retList.add(MessageWidget(message: it));
    }
    return retList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider);
    final textEditingController = useTextEditingController();
    final debugMessages = ref.watch(debugMessagesProvider);
    useEffect(() {
      connect();
      socket.onConnect((data) {
        debugPrint('Connected to backend server!');
        /**
         * @param {String} sendMsgServer
         * @param {() => null}  - Listening from server(keyword : sendMsgServer)"
         */
        socket.on('sendMsgServer', (msg) {
          ref.read(debugMessagesProvider.notifier).addMessage(DebugMessage(
              type: msg['type'], message: msg['msg'], sender: msg['sender']));
        });
      });
      /**
       * if socket emit some errors, this coll back function will coll.
       * */
      socket.onConnectError((connectionError) {
        debugPrint(connectionError.toString());
      });
      socket.onError((error) {});
      return socket.dispose;
    }, []);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.go('/');
            },
          ),
          title: const Text(
            'Anonymous Group',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: makeMessageWidget(debugMessages: debugMessages),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                          hintText: 'Type here ...',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2))),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        final text = textEditingController.value.text;
                        if (text.isNotEmpty) {
                          sendMessage(
                              message: text, sender: userName.name, ref: ref);
                          ref.watch(debugMessagesProvider.notifier).addMessage(
                              DebugMessage(
                                  type: MessageUserType.ownMsg.messageTypeName,
                                  message: text,
                                  sender: userName.name));
                          print(debugMessages);
                          textEditingController.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.teal,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
