// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatDataState {
  Room? get currentRoom => throw _privateConstructorUsedError;
  Message? get lastMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatDataStateCopyWith<ChatDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDataStateCopyWith<$Res> {
  factory $ChatDataStateCopyWith(
          ChatDataState value, $Res Function(ChatDataState) then) =
      _$ChatDataStateCopyWithImpl<$Res, ChatDataState>;
  @useResult
  $Res call({Room? currentRoom, Message? lastMessage});
}

/// @nodoc
class _$ChatDataStateCopyWithImpl<$Res, $Val extends ChatDataState>
    implements $ChatDataStateCopyWith<$Res> {
  _$ChatDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRoom = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      currentRoom: freezed == currentRoom
          ? _value.currentRoom
          : currentRoom // ignore: cast_nullable_to_non_nullable
              as Room?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatDataStateImplCopyWith<$Res>
    implements $ChatDataStateCopyWith<$Res> {
  factory _$$ChatDataStateImplCopyWith(
          _$ChatDataStateImpl value, $Res Function(_$ChatDataStateImpl) then) =
      __$$ChatDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Room? currentRoom, Message? lastMessage});
}

/// @nodoc
class __$$ChatDataStateImplCopyWithImpl<$Res>
    extends _$ChatDataStateCopyWithImpl<$Res, _$ChatDataStateImpl>
    implements _$$ChatDataStateImplCopyWith<$Res> {
  __$$ChatDataStateImplCopyWithImpl(
      _$ChatDataStateImpl _value, $Res Function(_$ChatDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRoom = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_$ChatDataStateImpl(
      currentRoom: freezed == currentRoom
          ? _value.currentRoom
          : currentRoom // ignore: cast_nullable_to_non_nullable
              as Room?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc

class _$ChatDataStateImpl extends _ChatDataState {
  _$ChatDataStateImpl({this.currentRoom, this.lastMessage}) : super._();

  @override
  final Room? currentRoom;
  @override
  final Message? lastMessage;

  @override
  String toString() {
    return 'ChatDataState(currentRoom: $currentRoom, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDataStateImpl &&
            (identical(other.currentRoom, currentRoom) ||
                other.currentRoom == currentRoom) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentRoom, lastMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDataStateImplCopyWith<_$ChatDataStateImpl> get copyWith =>
      __$$ChatDataStateImplCopyWithImpl<_$ChatDataStateImpl>(this, _$identity);
}

abstract class _ChatDataState extends ChatDataState {
  factory _ChatDataState(
      {final Room? currentRoom,
      final Message? lastMessage}) = _$ChatDataStateImpl;
  _ChatDataState._() : super._();

  @override
  Room? get currentRoom;
  @override
  Message? get lastMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatDataStateImplCopyWith<_$ChatDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
