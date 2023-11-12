import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/user/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

const _mockedHttpUri = 'http://192.168.1.26:3000';

class DebugChatPage extends HookConsumerWidget {
  DebugChatPage({super.key});

  late final IO.Socket socket;

  void connect() {
    socket = IO.io(_mockedHttpUri,
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider);
    useEffect(() {
      connect();
      socket.onConnect((data) {
        debugPrint('Connected to backend server!');
      });
      socket.onConnectError((connectionError) {
        debugPrint(connectionError.toString());
      });
      socket.onError((error) {

      });
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
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Type here ...',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2))),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
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
