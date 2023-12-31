import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'chat/chat_page.dart';
import 'login/login_page.dart';
import 'main/main_page.dart';
import 'chat/debug_chat_page.dart';
import 'chat/debug_chat_entry_page.dart';

final router = GoRouter(
  routes: [
    // Debug Page
    GoRoute(
        path: '/',
        builder: (context, state) => const DebugChatEntryPage()),
        // builder: (context, state) => const Scaffold(body: LoginPage())),
    GoRoute(
        path: '/debug_chat',
        builder: (context, state) => DebugChatPage()),
    GoRoute(
        path: '/login',
        builder: (context, state) => Scaffold(
              body: const LoginPage(),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/main');
                },
              ),
            )),
    GoRoute(
      path: '/main',
      builder: (context, state) => Scaffold(
          body: const MainPage(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/login');
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
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
              body: ChatPage(),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/main');
                },
              ),
            ))
  ],
);
