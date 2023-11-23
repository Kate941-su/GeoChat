import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/user/user.dart';
import 'package:uuid/uuid.dart';

final userProvider = StateProvider<User>((ref) => User(name: '', uuid: const Uuid().v4()));

final nameValidatorProvider = StateProvider<String?>((ref) => null);
