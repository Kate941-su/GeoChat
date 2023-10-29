import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'message/messages_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatPage extends HookConsumerWidget {
  const ChatPage({super.key});

  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      _loadMessages(ref);
      return null;
    }, []);
    final messages = ref.watch(messagesProvider);
    return Chat(
      messages: messages,
      onAttachmentPressed: () => _handleAttachmentPressed(context, ref),
      onMessageTap: (context, message) async =>
          _handleMessageTap(context, message, ref),
      onPreviewDataFetched: (message, previewData) =>
          _handlePreviewDataFetched(message, previewData, ref),
      onSendPressed: (partialText) => _handleSendPressed(partialText, ref),
      showUserAvatars: true,
      showUserNames: true,
      user: _user,
    );
  }

  void _handleAttachmentPressed(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection(ref);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection(ref);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection(WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );
      ref.read(messagesProvider.notifier).addMessage(message);
    }
  }

  void _handleImageSelection(WidgetRef ref) async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      ref.read(messagesProvider.notifier).addMessage(message);
    }
  }

  Future<void> _handleMessageTap(
      BuildContext _, types.Message message, WidgetRef ref) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index = ref.read(messagesProvider.notifier).findIndex(message);
          final updatedMessage =
              (ref.watch(messagesProvider)[index] as types.FileMessage).copyWith(
            isLoading: true,
          );
          ref
              .read(messagesProvider.notifier)
              .updateMessage(updatedMessage, index);

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          ref.read(messagesProvider.notifier).findIndex(message);
          final updatedMessage =
              (ref.watch(messagesProvider)[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          ref
              .read(messagesProvider.notifier)
              .updateMessage(updatedMessage, index);
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData, WidgetRef ref) {
    final index = ref.read(messagesProvider.notifier).findIndex(message);
    final updatedMessage = (ref.watch(messagesProvider)[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    ref.read(messagesProvider.notifier).updateMessage(updatedMessage, index);
  }

  void _handleSendPressed(types.PartialText message, WidgetRef ref) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    ref.read(messagesProvider.notifier).addMessage(textMessage);
  }

  void _loadMessages(WidgetRef ref) async {
    final response =
        await rootBundle.loadString('assets/mock/json/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();
    ref.read(messagesProvider.notifier).loadMessage(messages);
  }
}