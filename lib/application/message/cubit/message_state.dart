part of 'message_cubit.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.initial() = _Initial;
  const factory MessageState.loading() = _Loading;
  const factory MessageState.uploading() = _Uploading;
  const factory MessageState.imageUploaded(PartialImage partialImage) =
      _ImageUploaded;
  const factory MessageState.videoUploaded(PartialVideo partialVideo) =
      _VideoUploaded;
  const factory MessageState.fileUploaded(PartialFile partialFile) =
      _FileUploaded;

  const factory MessageState.error() = _Error;
}
