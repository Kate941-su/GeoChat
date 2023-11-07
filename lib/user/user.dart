import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    // required String firstName,
    // required String lastName,
    // required int age,
    required String name,
  }) = _User;
}
