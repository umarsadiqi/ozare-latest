import 'package:flutter/material.dart';
import 'package:ozare/common/widgets/heading.dart';

import '../widgets/widgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarProfileSection.singlePage(
          title: 'Notifications',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              const Heading(heading: 'Today'),
              const SizedBox(height: 8),
              ...List.generate(3, (index) => const NotificationTile()),
              const SizedBox(height: 12),
              const Heading(heading: 'Yesterday'),
              const SizedBox(height: 8),
              ...List.generate(3, (index) => const NotificationTile()),
              const SizedBox(height: 12),
              const Heading(heading: 'December 22, 2022'),
              const SizedBox(height: 8),
              ...List.generate(3, (index) => const NotificationTile()),
              const SizedBox(height: 32),
            ]),
          ),
        )
      ],
    );
  }
}
