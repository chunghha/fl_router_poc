import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backwardsCompatibility: false,
          title: Text('Signup'),
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
              child: Text('Signup'),
            ),
            TextButton(
              onPressed: () => QR.navigator.replaceAll('/login'),
              child: Text('Have account? login.'),
            )
          ],
        ),
      );
}
