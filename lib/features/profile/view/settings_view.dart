import 'package:flutter/material.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/features/profile/widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const Heading(heading: 'Personal Info'),
          const SizedBox(height: 8),
          OptionsBox(children: [
            ProfileTile(
              label: 'Wallet',
              icon: Icons.account_balance_wallet_outlined,
              onTap: () {},
            ),
            ProfileTile(
              label: 'Statistics',
              icon: Icons.bar_chart_outlined,
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 24),
          const Heading(heading: 'Settings'),
          const SizedBox(height: 8),
          OptionsBox(children: [
            ProfileTile(
              label: 'Notifications',
              icon: Icons.notifications_active_outlined,
              onTap: () {},
            ),
            ProfileTile(
              label: 'Preferences',
              icon: Icons.settings_outlined,
              onTap: () {},
            ),
            ProfileTile(
              label: 'Languages',
              icon: Icons.language_outlined,
              onTap: () {},
            ),
            ProfileTile(
              label: 'Log Out',
              icon: Icons.logout_outlined,
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 24),
          const Heading(heading: 'Support'),
          const SizedBox(height: 8),
          OptionsBox(children: [
            ProfileTile(
              label: 'Get Help',
              icon: Icons.help_outline,
              onTap: () {},
            ),
            ProfileTile(
              label: 'FAQ',
              icon: Icons.question_answer_outlined,
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 72),
        ],
      ),
    ));
  }
}
