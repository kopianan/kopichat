part of 'message_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  const factory MessageEvent.started() = StartedEvent;
  const factory MessageEvent.sendMessage(PartialText text, String roomId) =
      SendMessageEvent;
  const factory MessageEvent.watchAllMessage(Room room) = WatchAllMessageEvent;
  const factory MessageEvent.messageReceived(
      Either<String, List<Message>> messages) = MessageReceivedEvent;
}
