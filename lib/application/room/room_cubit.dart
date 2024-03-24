import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/room/room_repository.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

@injectable
class RoomCubit extends Cubit<RoomState> {
  RoomCubit(this.roomRepository) : super(const RoomState.initial());
  RoomRepository roomRepository;
  void watchAllRooms() {
    emit(const RoomState.loading());
    roomRepository.watchRooms().listen((event) {
      event.fold(
        (l) => emit(const RoomState.error("Error")),
        (r) => emit(RoomState.success(r)),
      );
    });
  }

  void createSingleRoom(User user) async {
    emit(const RoomState.loading());
    final result = await roomRepository.createSingleRoom(user);
    result.fold(
      (l) => emit(RoomState.error(l)),
      (r) => emit(RoomState.onRoomCreated(r)),
    );
  }
}
