import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import '../common/base_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          _buildSectionHeader("accountSettings".tr()),
          _buildSettingsGroup([
            _buildModernItem(
              icon: Icons.person_outline_rounded,
              title: "editProfile".tr(),
              onTap: () {},
            ),
            _buildModernItem(
              icon: Icons.lock_outline_rounded,
              title: "changePassword".tr(),
              onTap: () {},
            ),
            _buildModernItem(
              icon: Icons.delete_forever_outlined,
              title: "deleteAccount".tr(),
              titleColor: Colors.redAccent,
              onTap: () => _showDeleteDialog(context),
              showArrow: false,
            ),
          ]),

          _buildSectionHeader("preferences".tr()),
          _buildSettingsGroup([
            _buildModernItem(
              icon: Icons.language_rounded,
              title: "language".tr(),
              trailing: CustomText("langName".tr(), color: Colors.grey),
              onTap: () {},
            ),
            _buildModernItem(
              icon: Icons.dark_mode_outlined,
              title: "darkMode".tr(),
              trailing: Switch.adaptive(
                value: false,
                onChanged: (v) {},
                activeColor: Theme.of(context).primaryColor,
              ),
              onTap: null,
            ),
            _buildModernItem(
              icon: Icons.notifications_none_rounded,
              title: "notifications".tr(),
              onTap: () {},
            ),
          ]),

          _buildSectionHeader("business".tr()),
          _buildSettingsGroup([
            _buildModernItem(
              icon: Icons.card_membership_rounded,
              title: "mySubscription".tr(),
              onTap: () {},
            ),
            _buildModernItem(
              icon: Icons.list_alt_rounded,
              title: "myAds".tr(),
              onTap: () {},
            ),
          ]),

          _buildSectionHeader("supportLegal".tr()),
          _buildSettingsGroup([
            _buildModernItem(
              icon: Icons.info_outline_rounded,
              title: "aboutUs".tr(),
              onTap: () {},
            ),
            _buildModernItem(
              icon: Icons.privacy_tip_outlined,
              title: "privacyPolicy".tr(),
              onTap: () {},
            ),
            _buildModernItem(
              icon: Icons.contact_support_outlined,
              title: "contactUs".tr(),
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 24),
          Center(
            child: CustomText(
              "${"version".tr()} 1.0.0",
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 40),
        ],

    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 10, top: 10),
      child: CustomText(
        title,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.deepPurple.shade900,
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              items[index],
              if (index != items.length - 1)
                Divider(height: 1, indent: 50, color: Colors.grey.shade100),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildModernItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback? onTap,
    Color? titleColor,
    bool showArrow = true,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (titleColor ?? Colors.blueAccent).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: titleColor ?? Colors.blueAccent, size: 22),
      ),
      title: CustomText(
        title,
        fontWeight: FontWeight.w500,
        color: titleColor ?? Colors.black87,
      ),
      trailing: trailing ?? (showArrow ? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey) : null),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: CustomText("deleteAccountTitle".tr(), fontWeight: FontWeight.bold),
        content: CustomText("deleteAccountWarning".tr()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: CustomText("cancel".tr(), color: Colors.grey)),
          TextButton(
            onPressed: () {},
            child: CustomText("delete".tr(), color: Colors.red),
          ),
        ],
      ),
    );
  }
}