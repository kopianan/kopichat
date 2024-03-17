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

import 'application/auth/auth_cubit.dart' as _i11;
import 'application/friend/friend_cubit.dart' as _i10;
import 'domain/auth/auth_repository.dart' as _i8;
import 'domain/friend/friend_repository.dart' as _i5;
import 'infrastructure/auth/auth_datasource.dart' as _i9;
import 'infrastructure/core/fb_module.dart' as _i12;
import 'infrastructure/friend/friend_datasource.dart' as _i6;

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
    gh.singleton<_i8.AuthReposiotry>(_i9.AuthDatasource(
      gh<_i3.FirebaseAuth>(),
      gh<_i7.GoogleSignIn>(),
      gh<_i4.FirebaseChatCore>(),
    ));
    gh.factory<_i10.FriendCubit>(
        () => _i10.FriendCubit(gh<_i5.FriendRepository>()));
    gh.factory<_i11.AuthCubit>(() => _i11.AuthCubit(gh<_i8.AuthReposiotry>()));
    return this;
  }
}

class _$FBModule extends _i12.FBModule {}
