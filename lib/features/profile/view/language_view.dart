import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/auth/widgets/widgets.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Select Language',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          LanguageTile(
            label: 'English (US)',
            code: FlagsCode.US,
            isActive: true,
            onTap: () {},
          ),
          LanguageTile(
            label: 'Russian (RU)',
            code: FlagsCode.RU,
            isActive: false,
            onTap: () {},
          ),
          LanguageTile(
            label: 'Hindi (IN)',
            code: FlagsCode.IN,
            isActive: false,
            onTap: () {},
          ),
          LanguageTile(
            label: 'German (DE)',
            code: FlagsCode.DE,
            isActive: false,
            onTap: () {},
          ),
          LanguageTile(
            label: 'Portuguese (BR)',
            code: FlagsCode.BR,
            isActive: false,
            onTap: () {},
          ),
          LanguageTile(
            label: 'Indonesian (ID)',
            code: FlagsCode.ID,
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          OButton(onTap: () {}, label: "Save & Continue")
        ]),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.onTap,
    required this.label,
    required this.code,
    required this.isActive,
  });

  final VoidCallback onTap;
  final String label;
  final FlagsCode code;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isActive ? 12 : 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isActive ? Colors.grey[200] : null,
      ),
      child: Row(children: [
        Flag.fromCode(code, height: 24, width: 24),
        const SizedBox(width: 16),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        const Spacer(),
        if (isActive)
          const Icon(
            Icons.check,
            size: 18,
            color: primary2Color,
          ),
      ]),
    );
  }
}
