import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/src/room.dart';
import 'package:flutter_chat_types/src/user.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/room/room_repository.dart';
import '../../domain/friend/friend_repository.dart';

@Singleton(as: RoomRepository)
class RoomDatasource implements RoomRepository {
  RoomDatasource(this.fbChatCore);
  final FirebaseChatCore fbChatCore;

  @override
  Stream<Either<String, List<Room>>> watchRooms() async* {
    yield* fbChatCore.rooms().map((event) => right(event));
  }
}
