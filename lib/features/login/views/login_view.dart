import 'package:flutter/material.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/core/theme/app_theme.dart';

import '../../../core/routes/route_constant.dart';
import '../../../core/theme/ui_utils.dart';
import '../../../core/widgets/common_text_form_field.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/skip_button_widget.dart';

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
    return Scaffold(
      backgroundColor: context.color.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.color.backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SkipButtonWidget(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.main,
                  arguments: {"from": "login", "isSkipped": true},
                );
              },
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                /// Welcome text
                CustomText(
                  "Welcome back",
                  fontSize: context.font.extraLarge,
                  color: context.color.textDefaultColor,
                ),

                const SizedBox(height: 30),

                /// Email field
                CommonInputFormField(
                  controller: emailController,
                  hintText: "Email address",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                /// Password field
                CommonInputFormField(
                  controller: passwordController,
                  hintText: "Password",
                  password: isObscure,
                  trailing: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  trailingTapped: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.forgotPassword,
                      );
                    },
                    child: CustomText(
                      "Forgot password?",
                      color: context.color.textLightColor,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Sign in button (UI only)
                UiUtils.buildButton(
                  context,
                  buttonTitle: "Sign in",
                  radius: 10,
                  disabled: emailController.text.isEmpty ||
                      passwordController.text.isEmpty,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    // UI-only: print input
                    debugPrint("Email: ${emailController.text}");
                    debugPrint("Password: ${passwordController.text}");
                  },
                ),

                const SizedBox(height: 30),

                /// Sign up row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      "Don’t have an account?",
                      color: context.color.textColorDark.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.twoStepSignupScreen,
                        );
                      },
                      child: CustomText(
                        "Sign up",
                        color: context.color.territoryColor,
                        showUnderline: true,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
