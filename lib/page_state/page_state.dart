import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

@freezed
abstract class PageState with _$PageState {
  const PageState._();
  const factory PageState.splash() = _Splash;
  const factory PageState.login() = _Login;
  const factory PageState.main() = _Main;
  const factory PageState.chat() = _Chat;
}