import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class FriendRepository {
  //watch friend list
  Stream<Either<String, List<types.User>>> watchFriends();
}
