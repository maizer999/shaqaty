import 'package:flutter/material.dart';
import 'package:flutter_core/features/common/base_scaffold.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/theme/app_icon.dart';
import '../../core/theme/ui_utils.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات ثابتة كمثال
    final companyTel1 = "+123456789";
    final companyTel2 = "+987654321";
    final companyEmail = "info@company.com";

    return BaseScaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "howCanWeHelp".tr(),
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black,
            ),
            const SizedBox(height: 15),

            // بيانات تواصل
            customTile(
              context,
              title: "callBtnLbl".tr(),
              svgImagePath: AppIcons.call,
              onTap: () => _showPhoneDialog(context, companyTel1, companyTel2),
            ),
            const SizedBox(height: 10),
            customTile(
              context,
              title: "companyEmailLbl".tr(),
              svgImagePath: AppIcons.message,
              onTap: () => _showEmailDialog(context, companyEmail),
            ),
            const SizedBox(height: 20),

            // محتوى HTML كمثال
            HtmlWidget(
              "<p>هذا مثال على محتوى HTML للشركة</p>",
              onTapUrl: (url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
            ),
          ],
        ),
      ),
    );
  }

  void _showPhoneDialog(BuildContext context, String number1, String? number2) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("chooseNumber".tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(number1, textAlign: TextAlign.center),
              onTap: () => launchUrl(Uri.parse("tel:$number1")),
            ),
            if (number2 != null)
              ListTile(
                title: Text(number2, textAlign: TextAlign.center),
                onTap: () => launchUrl(Uri.parse("tel:$number2")),
              ),
          ],
        ),
      ),
    );
  }

  void _showEmailDialog(BuildContext context, String email) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EmailSendWidget(email: email)),
    );
  }

  Widget customTile(
      BuildContext context, {
        required String title,
        required String svgImagePath,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.call, color: Colors.blue), // استبدل بالـ SVG إذا أحببت
          ),
          const SizedBox(width: 15),
          CustomText(title, fontWeight: FontWeight.w700, color: Colors.black),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        ],
      ),
    );
  }
}

class EmailSendWidget extends StatelessWidget {
  final String email;
  const EmailSendWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController subject = TextEditingController();
    final TextEditingController text = TextEditingController();

    return Scaffold(
      appBar: UiUtils.buildAppBar(
        context,
        title: "sendEmail".tr(),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: subject,
              decoration: InputDecoration(hintText: "subject".tr()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: TextEditingController(text: email),
              readOnly: true,
              decoration: InputDecoration(hintText: "companyEmailLbl".tr()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: text,
              maxLines: 5,
              decoration: InputDecoration(hintText: "writeSomething".tr()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final uri = Uri(
                  scheme: 'mailto',
                  path: email,
                  query: 'subject=${subject.text}&body=${text.text}',
                );
                await launchUrl(uri);
              },
              child: Text("sendEmail".tr()),
            ),
          ],
        ),
      ),
    );
  }
}
