import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug_message.freezed.dart';
@freezed
class DebugMessage with _$DebugMessage {
  factory DebugMessage({
    required String type,
    required String message,
    required String sender,
    @Default(false) bool isMarried,// If you want to define defaultCalue
  }) = _DebugMessage;
}