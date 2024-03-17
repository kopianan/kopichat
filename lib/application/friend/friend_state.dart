part of 'friend_cubit.dart';

@freezed
class FriendState with _$FriendState {
  const factory FriendState.initial() = _Initial;
  const factory FriendState.loading() = _Loading;
  const factory FriendState.success(List<User> users) = _Success;
  const factory FriendState.error(String errMsg) = _Error;
}
