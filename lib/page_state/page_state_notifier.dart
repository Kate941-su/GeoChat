import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/page_state/page_state.dart';

class PageStateNotifier extends StateNotifier<PageState> {
  PageStateNotifier() : super(const PageState.main());

  void changePageState({required PageState nextState}) {
    state = nextState;
  }

}
