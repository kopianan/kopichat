import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class ChatRepository {
  //watch friend list
  Stream<Either<String, List<types.Message>>> watchMessages(types.Room room); 

  Future<Either<String, Unit>> sendMessage(dynamic message, String roomId); 
}
