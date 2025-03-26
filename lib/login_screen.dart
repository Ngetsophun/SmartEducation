import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'google_auth_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  User? user;

  ///================= Sign in google
  Future<void> _handleSignIn() async {
    User? signedInUser = await GoogleAuthService().signInWithGoogle();
    setState(() {
      user = signedInUser;
    });
  }

  ///========  Sign Out
  Future<void> _handleSignOut() async {
    // await FacebookAuthService().signOutFromFacebook();
    await GoogleAuthService().signOutFromGoogle();
    setState(() {
      user = null;
    });
  }

  ///================Sign in facebook

  // Future<void> _handleFacebookSignIn() async {
  //   User? signedInUser = await FacebookAuthService().signInWithFacebook();
  //   setState(() {
  //     user = signedInUser;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sign-In with Firebase')),
      body: Center(
        child: user == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _handleSignIn,
              child: const Text('Sign in with Google'),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ?? ''),
              radius: 40,
            ),
            const SizedBox(height: 10),
            Text("Name: ${user?.displayName ?? 'No Name'}"),
            Text("Email: ${user?.email ?? 'No Email'}"),
            Text("Phone: ${user?.phoneNumber ?? 'No Phone Number'}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSignOut,
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );

  }
}