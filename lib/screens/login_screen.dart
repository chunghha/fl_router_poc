import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backwardsCompatibility: false,
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Is Authed'),
                Switch(
                  value: AuthState.isAuthed,
                  onChanged: (v) {
                    setState(() {
                      AuthState.isAuthed = v;
                    });
                  },
                )
              ],
            ),
            TextButton(
              onPressed: () => QR.navigator.replaceAll('/home'),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => QR.navigator.replaceAll('/signup'),
              child: Text('Or Signup'),
            )
          ],
        ),
      );
}
