import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/chat/chat_repository.dart';
import 'package:kopichat/util/string_extension.dart';

part 'message_state.dart';
part 'message_cubit.freezed.dart';

@injectable
class MessageCubit extends Cubit<MessageState> {
  MessageCubit(this.chatRepository) : super(const MessageState.initial());
  ChatRepository chatRepository;

  void sendMessage(dynamic message, String roomId) {
    chatRepository.sendMessage(message, roomId);
  }

  void uploadImage(File file, String roomId) async {
    emit(const MessageState.uploading());

    final result = await chatRepository.uploadFile(file, roomId);
    result.fold(
      (l) => emit(const MessageState.error()),
      (r) {
        final partialImage = PartialImage(
          name: file.path.getFileName,
          size: file.lengthSync(),
          uri: r,
        );
        emit(MessageState.imageUploaded(partialImage));
      },
    );
  }

  void uploadVideo(File file, String roomId) async {
    emit(const MessageState.uploading());

    final result = await chatRepository.uploadFile(file, roomId);
    result.fold(
      (l) => emit(const MessageState.error()),
      (r) {
        final partialVideo = PartialVideo(
          name: file.path.getFileName,
          size: file.lengthSync(),
          uri: r,
        );
        emit(MessageState.videoUploaded(partialVideo));
      },
    );
  }

  void uploadFile(File file, String roomId) async {
    emit(const MessageState.uploading());
    final result = await chatRepository.uploadFile(file, roomId);
    result.fold(
      (l) => emit(const MessageState.error()),
      (r) {
        final partialFile = PartialFile(
          name: file.path.getFileName,
          size: file.lengthSync(),
          uri: r,
        );
        emit(MessageState.fileUploaded(partialFile));
      },
    );
  }
}
