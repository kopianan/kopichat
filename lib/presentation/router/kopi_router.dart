import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kopichat/presentation/pages/chat/chat_page.dart';
import 'package:kopichat/presentation/pages/home/home_page.dart';
import 'package:kopichat/presentation/pages/sign_in/sign_in_page.dart';
import 'package:kopichat/presentation/pages/sign_up/sign_up_page.dart';
import 'package:kopichat/presentation/pages/splash/splash_page.dart';
import 'package:kopichat/presentation/pages/welcome/welcome_page.dart';
part 'kopi_router.gr.dart';

@AutoRouterConfig()
class KopiRouter extends _$KopiRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(page: ChatRoute.page,),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: WelcomeRoute.page,
        ),
        AutoRoute(
          page: SplashRoute.page, initial: true
        ),
      ];
}
