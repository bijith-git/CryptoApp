import 'package:cryptoapp/model/user_model.dart';
import 'package:cryptoapp/provider/auth_provider.dart';
import 'package:cryptoapp/screens/home_screen.dart';
import 'package:cryptoapp/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context);
    return StreamBuilder(
        stream: authService.user,
        builder: (_, AsyncSnapshot<UserDetails?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            final UserDetails? user = snapshot.data;
            return user == null ? const LoginScreen() : const HomeScreen();
          } else {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
