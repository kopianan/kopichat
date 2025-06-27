// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_stream_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageStreamEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PartialText text, String roomId) sendMessage,
    required TResult Function(Room room) watchAllMessage,
    required TResult Function(Either<String, List<Message>> messages)
        messageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PartialText text, String roomId)? sendMessage,
    TResult? Function(Room room)? watchAllMessage,
    TResult? Function(Either<String, List<Message>> messages)? messageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PartialText text, String roomId)? sendMessage,
    TResult Function(Room room)? watchAllMessage,
    TResult Function(Either<String, List<Message>> messages)? messageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartedEvent value) started,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(WatchAllMessageEvent value) watchAllMessage,
    required TResult Function(MessageReceivedEvent value) messageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartedEvent value)? started,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult? Function(MessageReceivedEvent value)? messageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartedEvent value)? started,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult Function(MessageReceivedEvent value)? messageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStreamEventCopyWith<$Res> {
  factory $MessageStreamEventCopyWith(
          MessageStreamEvent value, $Res Function(MessageStreamEvent) then) =
      _$MessageStreamEventCopyWithImpl<$Res, MessageStreamEvent>;
}

/// @nodoc
class _$MessageStreamEventCopyWithImpl<$Res, $Val extends MessageStreamEvent>
    implements $MessageStreamEventCopyWith<$Res> {
  _$MessageStreamEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedEventImplCopyWith<$Res> {
  factory _$$StartedEventImplCopyWith(
          _$StartedEventImpl value, $Res Function(_$StartedEventImpl) then) =
      __$$StartedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$StartedEventImpl>
    implements _$$StartedEventImplCopyWith<$Res> {
  __$$StartedEventImplCopyWithImpl(
      _$StartedEventImpl _value, $Res Function(_$StartedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedEventImpl implements StartedEvent {
  const _$StartedEventImpl();

  @override
  String toString() {
    return 'MessageStreamEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PartialText text, String roomId) sendMessage,
    required TResult Function(Room room) watchAllMessage,
    required TResult Function(Either<String, List<Message>> messages)
        messageReceived,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PartialText text, String roomId)? sendMessage,
    TResult? Function(Room room)? watchAllMessage,
    TResult? Function(Either<String, List<Message>> messages)? messageReceived,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PartialText text, String roomId)? sendMessage,
    TResult Function(Room room)? watchAllMessage,
    TResult Function(Either<String, List<Message>> messages)? messageReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartedEvent value) started,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(WatchAllMessageEvent value) watchAllMessage,
    required TResult Function(MessageReceivedEvent value) messageReceived,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartedEvent value)? started,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult? Function(MessageReceivedEvent value)? messageReceived,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartedEvent value)? started,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult Function(MessageReceivedEvent value)? messageReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class StartedEvent implements MessageStreamEvent {
  const factory StartedEvent() = _$StartedEventImpl;
}

/// @nodoc
abstract class _$$SendMessageEventImplCopyWith<$Res> {
  factory _$$SendMessageEventImplCopyWith(_$SendMessageEventImpl value,
          $Res Function(_$SendMessageEventImpl) then) =
      __$$SendMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PartialText text, String roomId});
}

/// @nodoc
class __$$SendMessageEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$SendMessageEventImpl>
    implements _$$SendMessageEventImplCopyWith<$Res> {
  __$$SendMessageEventImplCopyWithImpl(_$SendMessageEventImpl _value,
      $Res Function(_$SendMessageEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? roomId = null,
  }) {
    return _then(_$SendMessageEventImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as PartialText,
      null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageEventImpl implements SendMessageEvent {
  const _$SendMessageEventImpl(this.text, this.roomId);

  @override
  final PartialText text;
  @override
  final String roomId;

  @override
  String toString() {
    return 'MessageStreamEvent.sendMessage(text: $text, roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageEventImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageEventImplCopyWith<_$SendMessageEventImpl> get copyWith =>
      __$$SendMessageEventImplCopyWithImpl<_$SendMessageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PartialText text, String roomId) sendMessage,
    required TResult Function(Room room) watchAllMessage,
    required TResult Function(Either<String, List<Message>> messages)
        messageReceived,
  }) {
    return sendMessage(text, roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PartialText text, String roomId)? sendMessage,
    TResult? Function(Room room)? watchAllMessage,
    TResult? Function(Either<String, List<Message>> messages)? messageReceived,
  }) {
    return sendMessage?.call(text, roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PartialText text, String roomId)? sendMessage,
    TResult Function(Room room)? watchAllMessage,
    TResult Function(Either<String, List<Message>> messages)? messageReceived,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(text, roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartedEvent value) started,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(WatchAllMessageEvent value) watchAllMessage,
    required TResult Function(MessageReceivedEvent value) messageReceived,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartedEvent value)? started,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult? Function(MessageReceivedEvent value)? messageReceived,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartedEvent value)? started,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult Function(MessageReceivedEvent value)? messageReceived,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessageEvent implements MessageStreamEvent {
  const factory SendMessageEvent(final PartialText text, final String roomId) =
      _$SendMessageEventImpl;

  PartialText get text;
  String get roomId;
  @JsonKey(ignore: true)
  _$$SendMessageEventImplCopyWith<_$SendMessageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchAllMessageEventImplCopyWith<$Res> {
  factory _$$WatchAllMessageEventImplCopyWith(_$WatchAllMessageEventImpl value,
          $Res Function(_$WatchAllMessageEventImpl) then) =
      __$$WatchAllMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Room room});
}

/// @nodoc
class __$$WatchAllMessageEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$WatchAllMessageEventImpl>
    implements _$$WatchAllMessageEventImplCopyWith<$Res> {
  __$$WatchAllMessageEventImplCopyWithImpl(_$WatchAllMessageEventImpl _value,
      $Res Function(_$WatchAllMessageEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$WatchAllMessageEventImpl(
      null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

class _$WatchAllMessageEventImpl implements WatchAllMessageEvent {
  const _$WatchAllMessageEventImpl(this.room);

  @override
  final Room room;

  @override
  String toString() {
    return 'MessageStreamEvent.watchAllMessage(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchAllMessageEventImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchAllMessageEventImplCopyWith<_$WatchAllMessageEventImpl>
      get copyWith =>
          __$$WatchAllMessageEventImplCopyWithImpl<_$WatchAllMessageEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PartialText text, String roomId) sendMessage,
    required TResult Function(Room room) watchAllMessage,
    required TResult Function(Either<String, List<Message>> messages)
        messageReceived,
  }) {
    return watchAllMessage(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PartialText text, String roomId)? sendMessage,
    TResult? Function(Room room)? watchAllMessage,
    TResult? Function(Either<String, List<Message>> messages)? messageReceived,
  }) {
    return watchAllMessage?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PartialText text, String roomId)? sendMessage,
    TResult Function(Room room)? watchAllMessage,
    TResult Function(Either<String, List<Message>> messages)? messageReceived,
    required TResult orElse(),
  }) {
    if (watchAllMessage != null) {
      return watchAllMessage(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartedEvent value) started,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(WatchAllMessageEvent value) watchAllMessage,
    required TResult Function(MessageReceivedEvent value) messageReceived,
  }) {
    return watchAllMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartedEvent value)? started,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult? Function(MessageReceivedEvent value)? messageReceived,
  }) {
    return watchAllMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartedEvent value)? started,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult Function(MessageReceivedEvent value)? messageReceived,
    required TResult orElse(),
  }) {
    if (watchAllMessage != null) {
      return watchAllMessage(this);
    }
    return orElse();
  }
}

abstract class WatchAllMessageEvent implements MessageStreamEvent {
  const factory WatchAllMessageEvent(final Room room) =
      _$WatchAllMessageEventImpl;

  Room get room;
  @JsonKey(ignore: true)
  _$$WatchAllMessageEventImplCopyWith<_$WatchAllMessageEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageReceivedEventImplCopyWith<$Res> {
  factory _$$MessageReceivedEventImplCopyWith(_$MessageReceivedEventImpl value,
          $Res Function(_$MessageReceivedEventImpl) then) =
      __$$MessageReceivedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<String, List<Message>> messages});
}

/// @nodoc
class __$$MessageReceivedEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$MessageReceivedEventImpl>
    implements _$$MessageReceivedEventImplCopyWith<$Res> {
  __$$MessageReceivedEventImplCopyWithImpl(_$MessageReceivedEventImpl _value,
      $Res Function(_$MessageReceivedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$MessageReceivedEventImpl(
      null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Either<String, List<Message>>,
    ));
  }
}

/// @nodoc

class _$MessageReceivedEventImpl implements MessageReceivedEvent {
  const _$MessageReceivedEventImpl(this.messages);

  @override
  final Either<String, List<Message>> messages;

  @override
  String toString() {
    return 'MessageStreamEvent.messageReceived(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageReceivedEventImpl &&
            (identical(other.messages, messages) ||
                other.messages == messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageReceivedEventImplCopyWith<_$MessageReceivedEventImpl>
      get copyWith =>
          __$$MessageReceivedEventImplCopyWithImpl<_$MessageReceivedEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PartialText text, String roomId) sendMessage,
    required TResult Function(Room room) watchAllMessage,
    required TResult Function(Either<String, List<Message>> messages)
        messageReceived,
  }) {
    return messageReceived(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PartialText text, String roomId)? sendMessage,
    TResult? Function(Room room)? watchAllMessage,
    TResult? Function(Either<String, List<Message>> messages)? messageReceived,
  }) {
    return messageReceived?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PartialText text, String roomId)? sendMessage,
    TResult Function(Room room)? watchAllMessage,
    TResult Function(Either<String, List<Message>> messages)? messageReceived,
    required TResult orElse(),
  }) {
    if (messageReceived != null) {
      return messageReceived(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartedEvent value) started,
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(WatchAllMessageEvent value) watchAllMessage,
    required TResult Function(MessageReceivedEvent value) messageReceived,
  }) {
    return messageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartedEvent value)? started,
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult? Function(MessageReceivedEvent value)? messageReceived,
  }) {
    return messageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartedEvent value)? started,
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(WatchAllMessageEvent value)? watchAllMessage,
    TResult Function(MessageReceivedEvent value)? messageReceived,
    required TResult orElse(),
  }) {
    if (messageReceived != null) {
      return messageReceived(this);
    }
    return orElse();
  }
}

abstract class MessageReceivedEvent implements MessageStreamEvent {
  const factory MessageReceivedEvent(
          final Either<String, List<Message>> messages) =
      _$MessageReceivedEventImpl;

  Either<String, List<Message>> get messages;
  @JsonKey(ignore: true)
  _$$MessageReceivedEventImplCopyWith<_$MessageReceivedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MessageStreamState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Message> messages) loadSuccess,
    required TResult Function() loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Message> messages)? loadSuccess,
    TResult? Function()? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Message> messages)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStreamStateCopyWith<$Res> {
  factory $MessageStreamStateCopyWith(
          MessageStreamState value, $Res Function(MessageStreamState) then) =
      _$MessageStreamStateCopyWithImpl<$Res, MessageStreamState>;
}

/// @nodoc
class _$MessageStreamStateCopyWithImpl<$Res, $Val extends MessageStreamState>
    implements $MessageStreamStateCopyWith<$Res> {
  _$MessageStreamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MessageStreamStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MessageStreamState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Message> messages) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Message> messages)? loadSuccess,
    TResult? Function()? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Message> messages)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MessageStreamState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$MessageStreamStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'MessageStreamState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Message> messages) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Message> messages)? loadSuccess,
    TResult? Function()? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Message> messages)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements MessageStreamState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$MessageStreamStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl implements _LoadSuccess {
  const _$LoadSuccessImpl(final List<Message> messages) : _messages = messages;

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessageStreamState.loadSuccess(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Message> messages) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadSuccess(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Message> messages)? loadSuccess,
    TResult? Function()? loadFailure,
  }) {
    return loadSuccess?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Message> messages)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements MessageStreamState {
  const factory _LoadSuccess(final List<Message> messages) = _$LoadSuccessImpl;

  List<Message> get messages;
  @JsonKey(ignore: true)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$MessageStreamStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFailureImpl implements _LoadFailure {
  const _$LoadFailureImpl();

  @override
  String toString() {
    return 'MessageStreamState.loadFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Message> messages) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Message> messages)? loadSuccess,
    TResult? Function()? loadFailure,
  }) {
    return loadFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Message> messages)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements MessageStreamState {
  const factory _LoadFailure() = _$LoadFailureImpl;
}
