import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:flutter_core/core/widgets/auth_text_field.dart';
import 'controller/login_provider.dart';
import 'package:flutter_core/features/login/views/widgets/divider_with_text.dart';
import 'package:flutter_core/features/login/views/widgets/login_footer.dart';
import 'package:flutter_core/features/login/views/widgets/login_header.dart';
import 'package:flutter_core/features/login/views/widgets/remember_forgot_row.dart';
import 'package:flutter_core/features/login/views/widgets/sign_in_button.dart';
import 'package:flutter_core/features/login/views/widgets/social_buttons.dart';

import '../../home/views/home_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;


  @override
  void initState() {
    super.initState();
    emailController.text = 'maizer99@gmail.com';
    passwordController.text = '123456';
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// ✅ SIDE EFFECTS (dialog + navigation)
    ref.listen(loginUserProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const CustomText("Login Failed"),
              content: CustomText(error.toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        },
        data: (data) {
          if (data != null && mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) =>  HomeScreen(),
              ),
            );
          }
        },
      );
    });

    /// 👀 UI STATE
    final loginState = ref.watch(loginUserProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF21899C),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoginHeader(),
                      const SizedBox(height: 16),

                      /// 📧 Email
                      AuthTextField(
                        controller: emailController,
                        hint: 'Enter your email',
                        icon: Icons.mail_rounded,
                        validator: (v) =>
                        v == null || v.isEmpty ? 'Email required' : null,
                      ),

                      const SizedBox(height: 12),

                      /// 🔐 Password
                      AuthTextField(
                        controller: passwordController,
                        hint: 'Enter your password',
                        icon: Icons.lock,
                        obscure: isObscure,
                        suffix: IconButton(
                          icon: Icon(
                            isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() => isObscure = !isObscure);
                          },
                        ),
                        validator: (v) =>
                        v == null || v.isEmpty ? 'Password required' : null,
                      ),

                      const SizedBox(height: 16),
                      const RememberForgotRow(),
                      const SizedBox(height: 24),

                      /// 🔘 Sign In Button
                      SignInButton(
                        isLoading: loginState.isLoading,
                        onTap: () {
                          if (loginState.isLoading) return;

                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(loginUserProvider.notifier)
                                .loginUser(
                              username:
                              emailController.text.trim(),
                              password:
                              passwordController.text.trim(),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 20),
                      const DividerWithText(text: 'Or Continue with'),
                      const SizedBox(height: 20),
                      const SocialButtons(),
                      const SizedBox(height: 20),
                      const LoginFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
