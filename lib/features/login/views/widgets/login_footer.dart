import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart'; // Added this
import '../../../../core/routes/route_constant.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, Routes.twoStepSignupScreen),
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.nunito(fontSize: 16.0, color: Colors.white),
          children: [
            TextSpan(text: 'dontHaveAccount'.tr()), // Translated part 1
            TextSpan(
              text: 'signUp'.tr(), // Translated part 2
              style: const TextStyle(
                  color: Color(0xFFF9CA58),
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}