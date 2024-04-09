import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/chat/chat_repository.dart';

part 'message_event.dart';
part 'message_state.dart';
part 'message_bloc.freezed.dart';

@injectable
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final ChatRepository chatRepository;
  StreamSubscription<Either<String, List<Message>>>? messageSubscription;

  MessageBloc(this.chatRepository) : super(const _Initial()) {
    on<WatchAllMessageEvent>((event, emit) async {
      emit(const MessageState.loadInProgress());
      messageSubscription?.cancel();
      messageSubscription = chatRepository
          .watchMessages(event.room)
          .listen((result) => add(MessageReceivedEvent(result)));
    });

    on<MessageReceivedEvent>((event, emit) async {
      event.messages.fold(
        (l) => emit(const MessageState.loadFailure()),
        (r) => emit(MessageState.loadSuccess(r)),
      );
    });

    on<SendMessageEvent>((event, emit) async {
      chatRepository.sendMessage(event.text, event.roomId);
    });
  }
  @override
  Future<void> close() {
    messageSubscription?.cancel();
    return super.close();
  }
}
