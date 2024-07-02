import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_school/screens/home%20screens/bottom_nav_bar.dart';
import 'package:my_school/screens/login_signUp/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // User is authenticated, show the main screen with bottom nav bar
          return BottomNavBar(user: snapshot.data!);
        } else {
          // No user authenticated, show the sign-in screen
          return GoogleSignInScreen();
        }
      },
    );
  }
}
