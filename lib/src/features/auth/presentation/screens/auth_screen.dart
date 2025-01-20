import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AuthScreen(),
    );
  }

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final providers = [EmailAuthProvider()];
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      sideBuilder: (s, g) {
        return const SizedBox(
          child: Center(
            child: Text("Vehicle Tracker"),
          ),
        );
      },
      providers: [
        EmailAuthProvider(),
      ],
      actions: [
        AuthStateChangeAction<UserCreated>((context, state) {
          /// Handle user created

        }),
        AuthStateChangeAction<SignedIn>((context, state) {

        }),
      ],
    );
  }
}
