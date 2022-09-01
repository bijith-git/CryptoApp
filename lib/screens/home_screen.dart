import 'package:cryptoapp/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Home',
              ),
              ElevatedButton(
                  onPressed: () async {
                    await auth.signOutAccount();
                  },
                  child: const Text('logout'))
            ],
          ),
        ),
      ),
    );
  }
}
