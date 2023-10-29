import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'chat/chat_page.dart';
import 'login/login_page.dart';
import 'main/main_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(body: LoginPage())),
    GoRoute(
        path: '/login',
        builder: (context, state) => const Scaffold(body: LoginPage())),
    GoRoute(
      path: '/main',
      builder: (context, state) => Scaffold(
          body: const MainPage(),
          bottomNavigationBar: BottomNavigationBar(
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
    ),
    GoRoute(
        path: '/chat',
        builder: (context, state) => Scaffold(
              appBar: AppBar(),
              body: const ChatPage(),
            ))
  ],
);
