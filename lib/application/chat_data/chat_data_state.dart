part of 'chat_data_cubit.dart';

@freezed
class ChatDataState with _$ChatDataState {
  const ChatDataState._();
  factory ChatDataState({
    Room? currentRoom,
    Message? lastMessage
  }) = _ChatDataState;
  factory ChatDataState.initial() => ChatDataState();
 
}
