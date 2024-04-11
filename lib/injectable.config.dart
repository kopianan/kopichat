// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit.dart' as _i21;
import 'application/authentication/authentication_cubit.dart' as _i14;
import 'application/chat_data/chat_data_cubit.dart' as _i3;
import 'application/friend/friend_cubit.dart' as _i17;
import 'application/message/bloc/message_stream_bloc.dart' as _i19;
import 'application/message/cubit/message_cubit.dart' as _i18;
import 'application/room/room_cubit.dart' as _i20;
import 'domain/auth/auth_repository.dart' as _i12;
import 'domain/chat/chat_repository.dart' as _i15;
import 'domain/friend/friend_repository.dart' as _i7;
import 'domain/room/room_repository.dart' as _i10;
import 'infrastructure/auth/auth_datasource.dart' as _i13;
import 'infrastructure/chat/chat_datasource.dart' as _i16;
import 'infrastructure/core/fb_module.dart' as _i22;
import 'infrastructure/friend/friend_datasource.dart' as _i8;
import 'infrastructure/room/room_datasource.dart' as _i11;

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
    gh.singleton<_i6.FirebaseStorage>(fBModule.getFirebaseStorage);
    gh.singleton<_i7.FriendRepository>(
        _i8.FriendDatasource(gh<_i5.FirebaseChatCore>()));
    gh.singleton<_i9.GoogleSignIn>(fBModule.getGoogleSignin);
    gh.singleton<_i10.RoomRepository>(
        _i11.RoomDatasource(gh<_i5.FirebaseChatCore>()));
    gh.singleton<_i12.AuthReposiotry>(_i13.AuthDatasource(
      gh<_i4.FirebaseAuth>(),
      gh<_i9.GoogleSignIn>(),
      gh<_i5.FirebaseChatCore>(),
    ));
    gh.singleton<_i14.AuthenticationCubit>(
        _i14.AuthenticationCubit(gh<_i12.AuthReposiotry>()));
    gh.singleton<_i15.ChatRepository>(_i16.ChatDatasource(
      gh<_i5.FirebaseChatCore>(),
      gh<_i6.FirebaseStorage>(),
    ));
    gh.factory<_i17.FriendCubit>(
        () => _i17.FriendCubit(gh<_i7.FriendRepository>()));
    gh.factory<_i18.MessageCubit>(
        () => _i18.MessageCubit(gh<_i15.ChatRepository>()));
    gh.factory<_i19.MessageStreamBloc>(
        () => _i19.MessageStreamBloc(gh<_i15.ChatRepository>()));
    gh.factory<_i20.RoomCubit>(() => _i20.RoomCubit(gh<_i10.RoomRepository>()));
    gh.factory<_i21.AuthCubit>(() => _i21.AuthCubit(gh<_i12.AuthReposiotry>()));
    return this;
  }
}

class _$FBModule extends _i22.FBModule {}
