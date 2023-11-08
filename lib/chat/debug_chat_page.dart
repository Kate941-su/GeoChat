import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/user/user_provider.dart';
import 'package:go_router/go_router.dart';

class DebugChatPage extends ConsumerWidget {
  const DebugChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.go('/');
            },
          ),
          title: const Text(
            'Anonymous Group',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Type here ...',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2))),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: Colors.teal,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
