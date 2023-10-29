import 'package:flutter_training/page_state/page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_state_provider.g.dart';

@riverpod
class PageStateNotifier extends _$PageStateNotifier {
  @override
  PageState build() {
    return const PageState.login();
  }
  void setPageState({required PageState nextState}) {
    state = nextState;
  }
}
