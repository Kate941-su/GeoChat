import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/message/debug_message.dart';

import '../../Types/types.dart';

class MessageWidget extends ConsumerWidget {
  const MessageWidget({required this.message, super.key});

  final DebugMessage message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: message.type == MessageUserType.ownMsg.messageTypeName
          ? Alignment.centerRight
          : Alignment.centerLeft,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment:
            message.type == MessageUserType.ownMsg.messageTypeName
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
        children: [
          Text(
            message.senderUserId,
            style: TextStyle(
                color: message.type == MessageUserType.ownMsg.messageTypeName
                    ? Colors.red
                    : Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          Text(message.messageText)
        ],
      ),
    );
  }
}
