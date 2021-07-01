import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'app_router.dart';
import 'auth_state.dart';

class HomePage extends HookWidget {
  final QRouter _router;

  const HomePage(this._router, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navi = useListenable(_router.navigator);
    // ignore: avoid_print
    print(_navi.currentRoute.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              AuthState.isAuthed = false;
              QR.navigator.replaceAll('/login');
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: _router,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'store'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        currentIndex: AppRouter.tabs
            .indexWhere((element) => element == _router.routeName),
        onTap: (v) => QR.toName(AppRouter.tabs[v]),
      ),
    );
  }
}
