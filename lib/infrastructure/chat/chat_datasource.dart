import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_chat_types/src/message.dart';
import 'package:flutter_chat_types/src/room.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/chat/chat_repository.dart';
import 'package:kopichat/util/string_extension.dart';

@Singleton(as: ChatRepository)
class ChatDatasource implements ChatRepository {
  ChatDatasource(this.fbChatCore, this.fbStorage);
  final FirebaseChatCore fbChatCore;
  final FirebaseStorage fbStorage;

  @override
  Stream<Either<String, List<Message>>> watchMessages(Room room) async* {
    yield* fbChatCore.messages(room).map((event) => right(event));
  }

  @override
  Future<Either<String, Unit>> sendMessage(
      dynamic message, String roomId) async {
    fbChatCore.sendMessage(message, roomId);
    return right(unit);
  }

  @override
  Future<Either<String, String>> uploadFile(File image, String roomId) async {
    try {
      final ref = fbStorage.ref(roomId).child(image.path.getFileName);
      await ref.putFile(image);
      final url = await ref.getDownloadURL();
      return right(url);
    } catch (e) {
      return left("Error");
    }
  }
}
