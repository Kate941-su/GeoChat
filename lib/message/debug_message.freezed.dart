// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debug_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DebugMessage _$DebugMessageFromJson(Map<String, dynamic> json) {
  return _DebugMessage.fromJson(json);
}

/// @nodoc
mixin _$DebugMessage {
  String get type => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  String get messageText => throw _privateConstructorUsedError;
  String get senderUserId => throw _privateConstructorUsedError;
  String get sendDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DebugMessageCopyWith<DebugMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebugMessageCopyWith<$Res> {
  factory $DebugMessageCopyWith(
          DebugMessage value, $Res Function(DebugMessage) then) =
      _$DebugMessageCopyWithImpl<$Res, DebugMessage>;
  @useResult
  $Res call(
      {String type,
      String roomId,
      String messageId,
      String messageText,
      String senderUserId,
      String sendDateTime});
}

/// @nodoc
class _$DebugMessageCopyWithImpl<$Res, $Val extends DebugMessage>
    implements $DebugMessageCopyWith<$Res> {
  _$DebugMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? roomId = null,
    Object? messageId = null,
    Object? messageText = null,
    Object? senderUserId = null,
    Object? sendDateTime = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: null == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
      senderUserId: null == senderUserId
          ? _value.senderUserId
          : senderUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sendDateTime: null == sendDateTime
          ? _value.sendDateTime
          : sendDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebugMessageImplCopyWith<$Res>
    implements $DebugMessageCopyWith<$Res> {
  factory _$$DebugMessageImplCopyWith(
          _$DebugMessageImpl value, $Res Function(_$DebugMessageImpl) then) =
      __$$DebugMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String roomId,
      String messageId,
      String messageText,
      String senderUserId,
      String sendDateTime});
}

/// @nodoc
class __$$DebugMessageImplCopyWithImpl<$Res>
    extends _$DebugMessageCopyWithImpl<$Res, _$DebugMessageImpl>
    implements _$$DebugMessageImplCopyWith<$Res> {
  __$$DebugMessageImplCopyWithImpl(
      _$DebugMessageImpl _value, $Res Function(_$DebugMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? roomId = null,
    Object? messageId = null,
    Object? messageText = null,
    Object? senderUserId = null,
    Object? sendDateTime = null,
  }) {
    return _then(_$DebugMessageImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: null == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
      senderUserId: null == senderUserId
          ? _value.senderUserId
          : senderUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sendDateTime: null == sendDateTime
          ? _value.sendDateTime
          : sendDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebugMessageImpl implements _DebugMessage {
  _$DebugMessageImpl(
      {required this.type,
      required this.roomId,
      required this.messageId,
      required this.messageText,
      required this.senderUserId,
      required this.sendDateTime});

  factory _$DebugMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$DebugMessageImplFromJson(json);

  @override
  final String type;
  @override
  final String roomId;
  @override
  final String messageId;
  @override
  final String messageText;
  @override
  final String senderUserId;
  @override
  final String sendDateTime;

  @override
  String toString() {
    return 'DebugMessage(type: $type, roomId: $roomId, messageId: $messageId, messageText: $messageText, senderUserId: $senderUserId, sendDateTime: $sendDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebugMessageImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.senderUserId, senderUserId) ||
                other.senderUserId == senderUserId) &&
            (identical(other.sendDateTime, sendDateTime) ||
                other.sendDateTime == sendDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, roomId, messageId,
      messageText, senderUserId, sendDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DebugMessageImplCopyWith<_$DebugMessageImpl> get copyWith =>
      __$$DebugMessageImplCopyWithImpl<_$DebugMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebugMessageImplToJson(
      this,
    );
  }
}

abstract class _DebugMessage implements DebugMessage {
  factory _DebugMessage(
      {required final String type,
      required final String roomId,
      required final String messageId,
      required final String messageText,
      required final String senderUserId,
      required final String sendDateTime}) = _$DebugMessageImpl;

  factory _DebugMessage.fromJson(Map<String, dynamic> json) =
      _$DebugMessageImpl.fromJson;

  @override
  String get type;
  @override
  String get roomId;
  @override
  String get messageId;
  @override
  String get messageText;
  @override
  String get senderUserId;
  @override
  String get sendDateTime;
  @override
  @JsonKey(ignore: true)
  _$$DebugMessageImplCopyWith<_$DebugMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
