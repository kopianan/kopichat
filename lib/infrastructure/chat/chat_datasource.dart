import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/src/message.dart';
import 'package:flutter_chat_types/src/room.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/chat/chat_repository.dart';

@Singleton(as: ChatRepository)
class ChatDatasource implements ChatRepository {
  ChatDatasource(this.fbChatCore);
  final FirebaseChatCore fbChatCore;

  @override
  Stream<Either<String, List<Message>>> watchMessages(Room room) async* {
    yield* fbChatCore.messages(room).map((event) => right(event));
  }

  @override
  Future<Either<String, Unit>> sendMessage(dynamic message, String roomId) async{
    fbChatCore.sendMessage(message, roomId);
    return right(unit);
  }
}
