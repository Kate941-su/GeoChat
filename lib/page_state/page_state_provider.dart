import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/page_state/page_state.dart';
import 'package:flutter_training/page_state/page_state_notifier.dart';

final pageStateProvider = StateNotifierProvider<PageStateNotifier, PageState>((ref) {
return PageStateNotifier();
});
