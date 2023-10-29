import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_training/constant/colors/constant.dart';
import 'package:flutter_training/dev_util/const_value.dart';
import 'package:flutter_training/page_state/page_state.dart';
import 'package:flutter_training/page_state/page_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../page_state/page_state.dart';
import '../page_state/page_state_provider.dart';

import '../gen/assets.gen.dart';

String dateStringGenerator(DateTime latestChatArrival) {
  final now = DateTime.now();
  if (now.day != latestChatArrival.day) {
    return '${latestChatArrival.month}/${latestChatArrival.day}';
  } else {
    return '${latestChatArrival.hour}:${latestChatArrival.minute.toString().padLeft(2, '0')}';
  }
}

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      // ref
      //     .read(pageStateNotifierProvider.notifier)
      //     .setPageState(nextState: const PageState.main());
    }, []);
    return ListView.builder(
        itemCount: mockedListViewList.length,
        itemBuilder: (BuildContext context, int index) {
          return mockedListViewList[index];
        });
  }
}

/// TODO :
class CustomListTile extends HookConsumerWidget {
  const CustomListTile(
      {super.key,
      required this.userName,
      required this.latestChat,
      required this.imageProvider,
      required this.isOnline,
      required this.dateTime,
      required this.notificationCount});

  final String userName;
  final ImageProvider imageProvider;
  final String latestChat;
  final bool isOnline;
  final DateTime dateTime;
  final int notificationCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 70,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: Assets.images.avatar.provider())),
          ),
          Visibility(
            visible: isOnline,
            child: Positioned(
              right: 0,
              bottom: 0,
              child: Assets.images.onlineIcon.image(),
            ),
          )
        ]),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: AutoSizeText(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(dateStringGenerator(dateTime))
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 160,
            child: AutoSizeText(
              latestChat,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          NotificationCountIcon(notificationCount: notificationCount),
        ],
      ),
    );
  }
}

class NotificationCountIcon extends ConsumerWidget {
  const NotificationCountIcon({required this.notificationCount, super.key});

  final int notificationCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: colorNotificationIcon,
        shape: BoxShape.circle,
      ),
      child: AutoSizeText(
        notificationCount.toString(),
        minFontSize: 2,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

List<CustomListTile> mockedListViewList = [
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
  CustomListTile(
    isOnline: true,
    userName: 'user1',
    latestChat: 'latestChat',
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 3,
  ),
  CustomListTile(
    isOnline: false,
    userName: 'user2',
    latestChat: lolemIpsum,
    imageProvider: Assets.images.avatar.provider(),
    dateTime: DateTime.now(),
    notificationCount: 1000,
  ),
];
