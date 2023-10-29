import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/colors/constant.dart';
import '../gen/assets.gen.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 160),
            child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Assets.images.placeHolder.provider(),
                  ),
                )),
          ),
        ),
        LoginButton(
          title: 'Sign In Google',
          imagePath: Assets.images.googleLogo.path,
        ),
        LoginButton(
          title: 'Sign In Apple',
          imagePath: Assets.images.appleLogo.path,
        ),
      ],
    );
  }
}

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.title,
    required this.imagePath
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        child: Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            color: colorLoginButton,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))
          ),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image.asset(imagePath),
            ),
            title: Text(title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
        onTap: (){
          debugPrint('WIP : Implement $title');
        },
      ),
    );
  }
}