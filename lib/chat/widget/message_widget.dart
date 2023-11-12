import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Types/types.dart';

class MessageWidget extends ConsumerWidget {
  const MessageWidget(
      {required this.userName,
      required this.message,
      required this.messageType,
      super.key});

  final String userName;
  final String message;
  final MessageUserType messageType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: messageType == MessageUserType.ownMsg
          ? Alignment.centerRight
          : Alignment.centerLeft,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: messageType == MessageUserType.ownMsg
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [Text(userName), Text(message)],
      ),
    );
  }
}
