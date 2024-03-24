part of 'message_cubit.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.initial() = _Initial;
  const factory MessageState.loading() = _Loading;
  const factory MessageState.error() = _Error;
  const factory MessageState.onMessages(List<Message> messages) = _OnMessages;
}
