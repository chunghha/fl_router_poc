import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'auth_state.dart';
import 'home_page.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'widgets/tab_widget.dart';

class AppRouter {
  static List<String> tabs = [
    'Home Page',
    'Store Page',
    'Settings Page',
  ];

  static _getFadePageType() {
    return QFadePage(
      reverseTransitionDurationmilliseconds: 400,
      transitionDurationmilliseconds: 600,
    );
  }

  static _getSlidePageType() {
    return QSlidePage(
      barrierColor: Colors.black26,
      reverseTransitionDurationmilliseconds: 400,
      transitionDurationmilliseconds: 600,
    );
  }

  static final routes = [
    QRoute(
      pageType: _getFadePageType(),
      path: '/login',
      builder: () => LoginScreen(),
    ),
    QRoute(
      pageType: _getFadePageType(),
      path: '/signup',
      builder: () => SignupScreen(),
    ),
    QRoute.withChild(
      path: '/home',
      builderChild: (c) => HomePage(c),
      middleware: [
        // Set Auth middleware to redirect user when is not authed
        QMiddlewareBuilder(
          redirectGuardFunc: (s) async => AuthState.isAuthed ? null : '/login',
        ),
      ],
      children: [
        QRoute(
          name: tabs[0],
          pageType: _getSlidePageType(),
          path: '/',
          builder: () => TabWidget(
            'Home',
            Colors.deepOrange[100]!,
          ),
        ),
        QRoute(
          name: tabs[1],
          pageType: _getSlidePageType(),
          path: '/store',
          builder: () => TabWidget(
            'Store',
            Colors.indigo[100]!,
          ),
        ),
        QRoute(
          name: tabs[2],
          pageType: _getSlidePageType(),
          path: '/settings',
          builder: () => TabWidget(
            'Settings',
            Colors.red[100]!,
          ),
        ),
      ],
    ),
  ];
}
