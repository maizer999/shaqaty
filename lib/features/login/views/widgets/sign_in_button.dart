import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;

  const SignInButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.orange, // change to your color
          borderRadius: BorderRadius.circular(10),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            : const Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
