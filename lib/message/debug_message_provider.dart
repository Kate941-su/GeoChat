import 'debug_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debug_message_provider.g.dart';

// After implementing as all correct,
@riverpod
class DebugMessages extends _$DebugMessages {
  @override
  List<DebugMessage> build() {
    return [];
  }

  void addMessage(DebugMessage message) {
    state = [...state, message];
    print(state);
  }

  void updateMessage(DebugMessage message, index) {
    final tempState = state;
    tempState[index] = message;
    state = tempState;
  }

  void loadMessage(List<DebugMessage> messageList) {
    state = messageList;
  }
}

