import 'dart:io';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_training/Types/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

part 'messages_provider.g.dart';

// After implementing as all correct,
@riverpod
class Messages extends _$Messages {
  @override
  List<types.Message> build() {
    return [];
  }

  void addMessage(types.Message message) {
    state = [message, ...state];
  }

  void updateMessage(types.Message message, index) {
    final tempState = state;
    tempState[index] = message;
    state = tempState;
  }

  void loadMessage(List<types.Message> messageList) {
    state = messageList;
  }

  int findIndex(types.Message message) {
    return state.indexWhere((element) => element.id == message.id);
  }

  void sendTextMessage({required types.PartialText message, required IO.Socket socket}) {
    final messageId = const Uuid().v4();
    final data = {
      'type' : 'ownMsg',
      'dummy_friend_room_id' : 'dummy_friend_room_id',
      'message_id' : messageId,
      'sent_datetime' : DateTime.now(),
      'status' : 'offline',
    };
    socket.emit(EmitEventType.sendMsg.eventName, {'type': 'ownMsg', 'msg': message});
  }
}
