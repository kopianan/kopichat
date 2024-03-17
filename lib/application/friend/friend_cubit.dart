import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/friend/friend_repository.dart';

part 'friend_state.dart';
part 'friend_cubit.freezed.dart';

@injectable
class FriendCubit extends Cubit<FriendState> {
  FriendCubit(this.friendRepository) : super(FriendState.initial());
  final FriendRepository friendRepository;

  void streamAllFriends() async {
    emit(FriendState.loading());
    friendRepository.watchFriends().listen((event) {
      event.fold(
        (l) => emit(FriendState.error("Error")),
        (r) => emit(FriendState.success(r)),
      );
    });
  }
}
