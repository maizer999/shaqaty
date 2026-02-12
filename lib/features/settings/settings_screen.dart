import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_core/features/settings/theme_control.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Added Riverpod
import '../../core/utils/language/secure_storage.dart';
// Assuming the themeProvider is defined in your main or a theme_provider file
import '../../../main.dart';
import '../common/base_scaffold.dart';
import '../login/views/login_view.dart';

class SettingsScreen extends ConsumerWidget { // Changed to ConsumerWidget
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the current theme state
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: [
        // --- Account Section ---
        _buildSectionHeader(context, "accountSettings".tr()),
        _buildSettingsGroup(context, [
          _buildModernItem(
            context,
            icon: Icons.person_outline_rounded,
            title: "editProfile".tr(),
            onTap: () {},
          ),
          _buildModernItem(
            context,
            icon: Icons.lock_outline_rounded,
            title: "changePassword".tr(),
            onTap: () {},
          ),
        ]),

        // --- Preferences Section ---
        _buildSectionHeader(context, "preferences".tr()),
        _buildSettingsGroup(context, [
          _buildModernItem(
            context,
            icon: Icons.language_rounded,
            title: "language".tr(),
            trailing: CustomText("langName".tr(), color: Colors.grey),
            onTap: () {},
          ),
          _buildModernItem(
            context,
            icon: Icons.dark_mode_outlined,
            title: "darkMode".tr(),
            trailing: Switch.adaptive(
              value: isDarkMode,
              onChanged: (v) {
                // Call the toggle function from your provider
                ref.read(themeProvider.notifier).toggleTheme(v);
              },
              activeColor: Theme.of(context).primaryColor,
            ),
            onTap: null,
          ),
          _buildModernItem(
            context,
            icon: Icons.notifications_none_rounded,
            title: "notifications".tr(),
            onTap: () {},
          ),
        ]),

        // --- Business Section ---
        _buildSectionHeader(context, "business".tr()),
        _buildSettingsGroup(context, [
          _buildModernItem(
            context,
            icon: Icons.card_membership_rounded,
            title: "mySubscription".tr(),
            onTap: () {},
          ),
          _buildModernItem(
            context,
            icon: Icons.list_alt_rounded,
            title: "myAds".tr(),
            onTap: () {},
          ),
        ]),

        // --- Support Section ---
        _buildSectionHeader(context, "supportLegal".tr()),
        _buildSettingsGroup(context, [
          _buildModernItem(
            context,
            icon: Icons.info_outline_rounded,
            title: "aboutUs".tr(),
            onTap: () {},
          ),
          _buildModernItem(
            context,
            icon: Icons.privacy_tip_outlined,
            title: "privacyPolicy".tr(),
            onTap: () {},
          ),
          _buildModernItem(
            context,
            icon: Icons.contact_support_outlined,
            title: "contactUs".tr(),
            onTap: () {},
          ),
        ]),

        // --- Session Actions Section ---
        _buildSectionHeader(context, "accountActions".tr()),
        _buildSettingsGroup(context, [
          _buildModernItem(
            context,
            icon: Icons.logout_rounded,
            title: "logout".tr(),
            titleColor: Colors.orange.shade800,
            onTap: () => _showLogoutDialog(context),
            showArrow: false,
          ),
          _buildModernItem(
            context,
            icon: Icons.delete_forever_outlined,
            title: "deleteAccount".tr(),
            titleColor: Colors.redAccent,
            onTap: () => _showDeleteDialog(context),
            showArrow: false,
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

  // --- UI Components ---

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 10, top: 10),
      child: CustomText(
        title,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        // Adapt header color to Dark Mode
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.deepPurple.shade200
            : Colors.deepPurple.shade900,
      ),
    );
  }

  Widget _buildSettingsGroup(BuildContext context, List<Widget> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        // Use cardColor from theme instead of hardcoded white
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
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
                Divider(height: 1, indent: 50, color: Theme.of(context).dividerColor.withOpacity(0.2)),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildModernItem(
      BuildContext context, {
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
        // Ensure text is readable in both modes
        color: titleColor ?? (Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black87),
      ),
      trailing: trailing ??
          (showArrow
              ? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey)
              : null),
    );
  }

  // --- Dialogs ---

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: CustomText("logout".tr(), fontWeight: FontWeight.bold),
        content: CustomText("logoutConfirmation".tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: CustomText("cancel".tr(), color: Colors.grey),
          ),
          TextButton(
            onPressed: () async {
              await SecureStorageHelper.logout();
              if (context.mounted) {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                );
              }
            },
            child: CustomText("logout".tr(), color: Colors.orange.shade800),
          ),
        ],
      ),
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
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: CustomText("cancel".tr(), color: Colors.grey),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: CustomText("delete".tr(), color: Colors.red),
          ),
        ],
      ),
    );
  }
}