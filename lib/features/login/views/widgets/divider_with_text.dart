import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text, style: GoogleFonts.inter(fontSize: 12.0, color: Colors.white)),
        ),
        const Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }
}
