import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart'; // Added this
import '../../../../core/routes/route_constant.dart';

class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 17, height: 17,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(colors: [Color(0xFF00AD8F), Color(0xFF7BF4DF)]),
              ),
              child: const Icon(Icons.check, size: 12, color: Colors.white),
            ),
            const SizedBox(width: 8),
            // Translated "Remember me"
            Text(
                'rememberMe'.tr(),
                style: GoogleFonts.inter(color: Colors.white, fontSize: 13)
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.forgotPassword),
          // Translated "Forgot password?"
          child: Text(
              'forgotPassword'.tr(),
              style: GoogleFonts.inter(color: Colors.white, fontSize: 13)
          ),
        ),
      ],
    );
  }
}