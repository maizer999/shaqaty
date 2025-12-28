import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/network/app_cached_image.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(100), // Adjust this for more/less rounding
          child: Image.asset(
            'assets/svg/home.png',
            height: size.height / 6,
            fit: BoxFit.cover,
          ),
        ),


        // SvgPicture.asset('assets/svg/logo2.svg', height: size.height / 8),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(
            style: GoogleFonts.inter(fontSize: 23.12, color: Colors.white, letterSpacing: 2.0),
            children: const [
              TextSpan(text: 'LOGIN', style: TextStyle(fontWeight: FontWeight.w800)),
              TextSpan(text: 'PAGE', style: TextStyle(color: Color(0xFFFE9879), fontWeight: FontWeight.w800)),
            ],
          ),
        ),
      ],
    );
  }
}
