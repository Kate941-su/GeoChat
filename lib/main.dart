import 'package:flutter/material.dart';
import 'package:flutter_training/login/login_page.dart';
import 'package:flutter_training/page_state/page_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageStateProvider);
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: pageState.when(
            splash: () => null,
            login:  () => null,
            main: () => AppBar(title:const Placeholder(),),
            chat:  () => AppBar(title:const Placeholder(),)),
        body: LoginPage(),
        // body: MainPage(),
        // body: ChatPage(),
        // body: SplashPage(),
      ),
    );
  }
}