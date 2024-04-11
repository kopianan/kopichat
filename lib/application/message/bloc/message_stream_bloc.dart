import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/chat/chat_repository.dart';

part 'message_stream_event.dart';
part 'message_stream_state.dart';
part 'message_stream_bloc.freezed.dart';

@injectable
class MessageStreamBloc extends Bloc<MessageStreamEvent, MessageStreamState> {
  final ChatRepository chatRepository;
  StreamSubscription<Either<String, List<Message>>>? messageSubscription;

  MessageStreamBloc(this.chatRepository) : super(const _Initial()) {
    on<WatchAllMessageEvent>((event, emit) async {
      emit(const MessageStreamState.loadInProgress());
      messageSubscription?.cancel();
      messageSubscription = chatRepository
          .watchMessages(event.room)
          .listen((result) => add(MessageReceivedEvent(result)));
    });

    on<MessageReceivedEvent>((event, emit) async {
      event.messages.fold(
        (l) => emit(const MessageStreamState.loadFailure()),
        (r) => emit(MessageStreamState.loadSuccess(r)),
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
