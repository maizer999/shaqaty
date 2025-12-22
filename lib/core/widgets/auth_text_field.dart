import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final Widget? suffix;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.suffix,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 16),
          Container(height: 16, width: 1, color: Colors.white60),
          const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: obscure,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              validator: validator,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                suffixIcon: suffix,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
