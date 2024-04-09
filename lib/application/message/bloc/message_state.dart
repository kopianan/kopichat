part of 'message_bloc.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.initial() = _Initial;
  const factory MessageState.loadInProgress() = _LoadInProgress;
  const factory MessageState.loadSuccess(List<Message> messages) = _LoadSuccess;
  const factory MessageState.loadFailure() = _LoadFailure;
} 