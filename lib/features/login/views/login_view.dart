import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_core/build_context.dart';
import '../../../core/routes/route_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // Using the teal background color from your new UI
      backgroundColor: const Color(0xFF21899C),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height - MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  // Background SVGs
                  _buildBackgroundDecorations(),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 2),

                          // Logo & Header
                          _buildHeader(size),

                          const Spacer(flex: 1),

                          Text(
                            'Continue with email for sign in App',
                            style: GoogleFonts.inter(fontSize: 14.0, color: Colors.white),
                          ),

                          const SizedBox(height: 20),

                          // Input Fields
                          _buildEmailField(size),
                          const SizedBox(height: 12),
                          _buildPasswordField(size),

                          const SizedBox(height: 16),
                          _buildRememberAndForgot(context),

                          const Spacer(flex: 1),

                          // Action Buttons
                          _buildSignInButton(size),

                          const SizedBox(height: 20),
                          _buildDivider(),
                          const SizedBox(height: 20),

                          _buildSocialButtons(size),

                          const Spacer(flex: 1),
                          _buildFooter(context),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Stack(
      children: [
        Positioned(
          left: -34,
          top: 181.0,
          child: SvgPicture.string(
            '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            width: 99.0, height: 99.0,
          ),
        ),
        Positioned(
          right: -52,
          top: 45.0,
          child: SvgPicture.string(
            '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            width: 139.0, height: 139.0,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        SvgPicture.asset('assets/logo2.svg', height: size.height / 8),
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

  Widget _buildEmailField(Size size) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFF4DA1B0), borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          children: [
            const Icon(Icons.mail_rounded, color: Colors.white70),
            const SizedBox(width: 16),
            _buildFieldDivider(),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your gmail address',
                  hintStyle: GoogleFonts.inter(color: Colors.white70, fontSize: 14),
                  border: InputBorder.none,
                ),
                validator: (value) => (value == null || value.isEmpty) ? "Email is required" : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(Size size) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFF4DA1B0), borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          children: [
            const Icon(Icons.lock, color: Colors.white70),
            const SizedBox(width: 16),
            _buildFieldDivider(),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: passwordController,
                obscureText: isObscure,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.inter(color: Colors.white70, fontSize: 14),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.white70),
                    onPressed: () => setState(() => isObscure = !isObscure),
                  ),
                ),
                validator: (value) => (value == null || value.isEmpty) ? "Password is required" : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldDivider() {
    return Container(height: 15.5, width: 1.0, color: Colors.white.withOpacity(0.6));
  }

  Widget _buildRememberAndForgot(BuildContext context) {
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
            Text('Remember me', style: GoogleFonts.inter(color: Colors.white, fontSize: 13)),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.forgotPassword),
          child: Text('Forgot password?', style: GoogleFonts.inter(color: Colors.white, fontSize: 13)),
        ),
      ],
    );
  }

  Widget _buildSignInButton(Size size) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          debugPrint("Logging in: ${emailController.text}");
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(color: const Color(0xFFF56B3F), borderRadius: BorderRadius.circular(10.0)),
        child: Text('Sign in', style: GoogleFonts.inter(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('Or Continue with', style: GoogleFonts.inter(fontSize: 12.0, color: Colors.white)),
        ),
        const Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }

  Widget _buildSocialButtons(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialBtn('Google', size),
        _socialBtn('Facebook', size),
      ],
    );
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
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, Routes.twoStepSignupScreen),
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.nunito(fontSize: 16.0, color: Colors.white),
          children: const [
            TextSpan(text: 'Don’t have account? '),
            TextSpan(text: 'Sign up', style: TextStyle(color: Color(0xFFF9CA58), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}