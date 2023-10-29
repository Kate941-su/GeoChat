import 'package:flutter/material.dart';
import 'package:flutter_training/main/main_page.dart';
import 'package:flutter_training/page_state/page_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chat/chat_page.dart';

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
        appBar: pageState.whenOrNull(
            // main: () => AppBar(
            //   title:const Placeholder(),),
            ),
        // body: LoginPage(),
        // body: MainPage(),
        body: MainPage(),
        bottomNavigationBar: pageState.whenOrNull(
            main: () => BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble),
                      label: 'Chats',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people_alt),
                      label: 'Follows',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                )),
        // body: SplashPage(),
      ),
    );
  }
}
