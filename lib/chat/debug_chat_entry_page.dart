import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/user/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../user/user.dart';

class DebugChatEntryPage extends HookConsumerWidget {
  const DebugChatEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final nameValidatorText = ref.watch(nameValidatorProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Debug entry page')),
      body: Center(
        child: TextButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Please enter your name'),
                    content: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(fontSize: 20),
                          errorText: nameValidatorText,
                        ),
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            ref.read(nameValidatorProvider.notifier).state =
                                'User must have valid name';
                          } else {
                            ref.read(nameValidatorProvider.notifier).state =
                                null;
                          }
                          return null;
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            debugPrint('You entered as ${nameController.text}');
                            if (nameController.text.isNotEmpty) {
                              ref.read(userProvider.notifier).state =
                                  User(name: nameController.text, uuid: const Uuid().v1());
                              context.go('/debug_chat');
                            }
                          },
                          child: const Text('Enter'))
                    ],
                  )),
          child: const Text('initiate chat'),
        ),
      ),
    );
  }
}
