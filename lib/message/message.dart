import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
@freezed
class Message with _$Message {
  factory Message({
    required String type,
    required String message,
    required String sender,
    @Default(false) bool isMarried,// If you want to define defaultCalue
  }) = _Message;
}