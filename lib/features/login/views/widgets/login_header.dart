import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart'; // إضافة المكتبة

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/logo.png',
            height: size.height / 6,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(
            style: GoogleFonts.inter(
                fontSize: 23.12,
                color: Colors.white,
                letterSpacing: 2.0
            ),
            children: [
              // ترجمة الجزء الأول (LOGIN)
              TextSpan(
                  text: 'loginTitle'.tr(),
                  style: const TextStyle(fontWeight: FontWeight.w800)
              ),
              const TextSpan(text: ' '), // مسافة بسيطة بين الكلمتين
              // ترجمة الجزء الثاني (PAGE)
              TextSpan(
                  text: 'pageTitle'.tr(),
                  style: const TextStyle(
                      color: Color(0xFFFE9879),
                      fontWeight: FontWeight.w800
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}