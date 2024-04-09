// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit.dart' as _i20;
import 'application/authentication/authentication_cubit.dart' as _i13;
import 'application/chat_data/chat_data_cubit.dart' as _i3;
import 'application/friend/friend_cubit.dart' as _i16;
import 'application/message/bloc/message_bloc.dart' as _i17;
import 'application/message/message_cubit.dart' as _i18;
import 'application/room/room_cubit.dart' as _i19;
import 'domain/auth/auth_repository.dart' as _i11;
import 'domain/chat/chat_repository.dart' as _i14;
import 'domain/friend/friend_repository.dart' as _i6;
import 'domain/room/room_repository.dart' as _i9;
import 'infrastructure/auth/auth_datasource.dart' as _i12;
import 'infrastructure/chat/chat_datasource.dart' as _i15;
import 'infrastructure/core/fb_module.dart' as _i21;
import 'infrastructure/friend/friend_datasource.dart' as _i7;
import 'infrastructure/room/room_datasource.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final fBModule = _$FBModule();
    gh.factory<_i3.ChatDataCubit>(() => _i3.ChatDataCubit());
    gh.singleton<_i4.FirebaseAuth>(fBModule.getFirebaseAuth);
    gh.singleton<_i5.FirebaseChatCore>(fBModule.getFirebaseChatCore);
    gh.singleton<_i6.FriendRepository>(
        _i7.FriendDatasource(gh<_i5.FirebaseChatCore>()));
    gh.singleton<_i8.GoogleSignIn>(fBModule.getGoogleSignin);
    gh.singleton<_i9.RoomRepository>(
        _i10.RoomDatasource(gh<_i5.FirebaseChatCore>()));
    gh.singleton<_i11.AuthReposiotry>(_i12.AuthDatasource(
      gh<_i4.FirebaseAuth>(),
      gh<_i8.GoogleSignIn>(),
      gh<_i5.FirebaseChatCore>(),
    ));
    gh.singleton<_i13.AuthenticationCubit>(
        _i13.AuthenticationCubit(gh<_i11.AuthReposiotry>()));
    gh.singleton<_i14.ChatRepository>(
        _i15.ChatDatasource(gh<_i5.FirebaseChatCore>()));
    gh.factory<_i16.FriendCubit>(
        () => _i16.FriendCubit(gh<_i6.FriendRepository>()));
    gh.factory<_i17.MessageBloc>(
        () => _i17.MessageBloc(gh<_i14.ChatRepository>()));
    gh.factory<_i18.MessageCubit>(
        () => _i18.MessageCubit(gh<_i14.ChatRepository>()));
    gh.factory<_i19.RoomCubit>(() => _i19.RoomCubit(gh<_i9.RoomRepository>()));
    gh.factory<_i20.AuthCubit>(() => _i20.AuthCubit(gh<_i11.AuthReposiotry>()));
    return this;
  }
}

class _$FBModule extends _i21.FBModule {}
