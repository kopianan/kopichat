// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit.dart' as _i14;
import 'application/friend/friend_cubit.dart' as _i12;
import 'application/room/room_cubit.dart' as _i13;
import 'domain/auth/auth_repository.dart' as _i10;
import 'domain/friend/friend_repository.dart' as _i5;
import 'domain/room/room_repository.dart' as _i8;
import 'infrastructure/auth/auth_datasource.dart' as _i11;
import 'infrastructure/core/fb_module.dart' as _i15;
import 'infrastructure/friend/friend_datasource.dart' as _i6;
import 'infrastructure/room/room_datasource.dart' as _i9;

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
    gh.singleton<_i3.FirebaseAuth>(fBModule.getFirebaseAuth);
    gh.singleton<_i4.FirebaseChatCore>(fBModule.getFirebaseChatCore);
    gh.singleton<_i5.FriendRepository>(
        _i6.FriendDatasource(gh<_i4.FirebaseChatCore>()));
    gh.singleton<_i7.GoogleSignIn>(fBModule.getGoogleSignin);
    gh.singleton<_i8.RoomRepository>(
        _i9.RoomDatasource(gh<_i4.FirebaseChatCore>()));
    gh.singleton<_i10.AuthReposiotry>(_i11.AuthDatasource(
      gh<_i3.FirebaseAuth>(),
      gh<_i7.GoogleSignIn>(),
      gh<_i4.FirebaseChatCore>(),
    ));
    gh.factory<_i12.FriendCubit>(
        () => _i12.FriendCubit(gh<_i5.FriendRepository>()));
    gh.factory<_i13.RoomCubit>(() => _i13.RoomCubit(gh<_i8.RoomRepository>()));
    gh.factory<_i14.AuthCubit>(() => _i14.AuthCubit(gh<_i10.AuthReposiotry>()));
    return this;
  }
}

class _$FBModule extends _i15.FBModule {}
