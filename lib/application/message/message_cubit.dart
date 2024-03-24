import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/chat/chat_repository.dart';

part 'message_state.dart';
part 'message_cubit.freezed.dart';

@injectable
class MessageCubit extends Cubit<MessageState> {
  MessageCubit(this.chatRepository) : super(MessageState.initial());
  ChatRepository chatRepository;

  StreamSubscription<Either<String, List<Message>>>? _messageSubscription;

  void streamMessages(Room room) async {
    _messageSubscription?.cancel();
    _messageSubscription = chatRepository
        .watchMessages(room)
        .listen((event) => _onMessagesReceived(event));
  }

  void _onMessagesReceived(Either<String, List<Message>> data) {
    data.fold(
      (l) => emit(const MessageState.error()),
      (r) => emit(MessageState.onMessages(r)),
    );
  }

  void sendTextMessage(PartialText text, String roomId) {
    chatRepository.sendMessage(text, roomId);
  }

  void dispose() {
    _messageSubscription?.cancel();
  }
}
