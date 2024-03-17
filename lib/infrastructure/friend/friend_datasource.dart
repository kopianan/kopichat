import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/src/user.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:injectable/injectable.dart';
import '../../domain/friend/friend_repository.dart';

@Singleton(as: FriendRepository)
class FriendDatasource implements FriendRepository {
  FriendDatasource(this.fbChatCore);
  final FirebaseChatCore fbChatCore;

  @override
  Stream<Either<String, List<User>>> watchFriends() async* {
    yield* fbChatCore.users().map((event) => right(event));
  }
}
