part of 'message_stream_bloc.dart';

@freezed
class MessageStreamState with _$MessageStreamState {
  const factory MessageStreamState.initial() = _Initial;
  const factory MessageStreamState.loadInProgress() = _LoadInProgress;
  const factory MessageStreamState.loadSuccess(List<Message> messages) =
      _LoadSuccess;
  const factory MessageStreamState.loadFailure() = _LoadFailure;
}
