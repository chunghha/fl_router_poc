import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'app_router.dart';

class RouterApp extends StatelessWidget {
  const RouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: QRouteInformationParser(),
      routerDelegate: QRouterDelegate(
        AppRouter.routes,
        initPath: '/home',
      ),
      theme: ThemeData.light(),
    );
  }
}
