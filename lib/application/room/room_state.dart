part of 'room_cubit.dart';

@freezed
class RoomState with _$RoomState {
  const factory RoomState.initial() = _Initial;
  const factory RoomState.loading() = _Loading;
  const factory RoomState.success(List<Room> rooms) = _Success;
  const factory RoomState.error(String errMsg) = _Error;
  const factory RoomState.onRoomCreated(Room room) = _OnRoomCreated;
}
