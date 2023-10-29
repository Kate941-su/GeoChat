import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}
