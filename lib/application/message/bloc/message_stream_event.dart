part of 'message_stream_bloc.dart';

@freezed
class MessageStreamEvent with _$MessageStreamEvent {
  const factory MessageStreamEvent.started() = StartedEvent;
  const factory MessageStreamEvent.sendMessage(
      PartialText text, String roomId) = SendMessageEvent;
  const factory MessageStreamEvent.watchAllMessage(Room room) =
      WatchAllMessageEvent;
  const factory MessageStreamEvent.messageReceived(
      Either<String, List<Message>> messages) = MessageReceivedEvent;
}
