import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/user/user.dart';

final userProvider = StateProvider<User>((ref) => User(name: '', uuid: ''));

final nameValidatorProvider = StateProvider<String?>((ref) => null);
