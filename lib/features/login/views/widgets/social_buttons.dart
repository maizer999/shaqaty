
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart'; // <--- THIS WAS MISSING
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../controller/login_provider.dart';

class SocialButtons extends ConsumerWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    // Listen for state changes to handle UI feedback
    ref.listen(loginUserProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Backend Error: $error")),
          );
        },
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => _handleSocialSignIn(context, ref, 'google'),
          child: _socialBtn('Google', size),
        ),
        GestureDetector(
          onTap: () => _handleSocialSignIn(context, ref, 'facebook'),
          child: _socialBtn('Facebook', size),
        ),
      ],
    );
  }

  Future<void> _handleSocialSignIn(BuildContext context, WidgetRef ref, String type) async {
    try {
      debugPrint("--- DEBUG: Starting Firebase $type Sign-In ---");
      UserCredential? userCredential;

      if (type == 'google') {
        // 1. Google Auth Flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      } else {
        // 2. Facebook Auth Flow
        final LoginResult result = await FacebookAuth.instance.login();
        if (result.status != LoginStatus.success) return;

        final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
        userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      }

      // 3. GET FIREBASE ID TOKEN
      // This token is what you send to Laravel to verify the user
      final String? firebaseIdToken = await userCredential.user?.getIdToken();

      if (firebaseIdToken != null) {
        debugPrint("--- DEBUG: Firebase Token Obtained ---");
        // You should create a single 'loginWithFirebase' method in your notifier
        await ref.read(loginUserProvider.notifier).loginWithGoogle(firebaseIdToken);
      }

    } catch (e) {
      debugPrint("--- DEBUG ERROR: $type Login Failed: $e ---");
    }
  }

  Widget _socialBtn(String label, Size size) {
    return Container(
      width: size.width * 0.4,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}