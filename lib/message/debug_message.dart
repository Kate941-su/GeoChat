import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug_message.g.dart';
part 'debug_message.freezed.dart';
@freezed
class DebugMessage with _$DebugMessage {
  factory DebugMessage({
    required String type,
    required String roomId,
    required String messageId,
    required String messageText,
    required String senderUserId,
    required String sendDateTime,
  }) = _DebugMessage;

  factory DebugMessage.fromJson(Map<String, dynamic> json) =>
      _$DebugMessageFromJson(json);
}