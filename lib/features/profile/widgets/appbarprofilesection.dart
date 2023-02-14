import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/profile/bloc/profile_bloc.dart';
import 'package:ozare/features/profile/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/translations/locale_keys.g.dart';

class AppBarProfileSection extends StatelessWidget {
  const AppBarProfileSection({
    super.key,
    required this.page,
    required this.imageUrl,
  })  : title = '',
        singlePage = false,
        appBarAction = null;

  const AppBarProfileSection.singlePage({
    super.key,
    required this.title,
    this.appBarAction,
  })  : singlePage = true,
        page = PPage.profile,
        imageUrl = null;

  final PPage page;
  final String title;
  final String? imageUrl;
  final bool singlePage;
  final Widget? appBarAction;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: singlePage ? size.height * 0.125 : size.height * 0.28,
      width: size.width,
      child: Stack(alignment: Alignment.center, children: [
        // App Bar Section
        // height: size.height * 0.25,
        Positioned(
          top: 0,
          child: SizedBox(
            height: size.height * 0.22,
            width: size.width,
            child: ClipPath(
              clipper: OvalBottomClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: gradient,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.cover,
            color: Colors.white.withOpacity(0.11),
            width: size.width,
            height: size.height * 0.3,
          ),
        ),
        Positioned(
            top: 46,
            right: 24,
            left: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (page == PPage.profile || singlePage)
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white30,
                    child: Icon(
                      FontAwesome.award,
                      color: Colors.white,
                    ),
                  ),
                if (page != PPage.profile)
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ProfileBloc>()
                          .add(const ProfilePageChanged(PPage.profile));
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white30,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                Text(
                  singlePage ? title : getAppBarTitle(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                appBarAction ??
                    GestureDetector(
                      onTap: () {
                        context
                            .read<ProfileBloc>()
                            .add(const ProfilePageChanged(PPage.notifications));
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white30,
                        child: Icon(Icons.notifications_outlined,
                            color: Colors.white),
                      ),
                    ),
              ],
            )),
        if (!singlePage)
          Positioned(
            top: size.height * 0.135,
            left: 0,
            right: 0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              PButton(
                label: LocaleKeys.account.tr(),
                icon: Icons.person_outline,
                onTap: () {
                  context
                      .read<ProfileBloc>()
                      .add(const ProfilePageChanged(PPage.editAccount));
                },
              ),
              ProfilePhotoBox(
                page: page,
                imageUrl: imageUrl,
              ),
              PButton(
                label: LocaleKeys.settings.tr(),
                icon: Icons.settings_outlined,
                onTap: () {
                  context
                      .read<ProfileBloc>()
                      .add(const ProfilePageChanged(PPage.settings));
                },
              ),
            ]),
          ),
      ]),
    );
  }

  String getAppBarTitle() {
    switch (page) {
      case PPage.profile:
        return LocaleKeys.profile.tr();
      case PPage.settings:
        return LocaleKeys.settings.tr();
      case PPage.editAccount:
        return LocaleKeys.edit_account.tr();
      case PPage.notifications:
        return LocaleKeys.notifications.tr();
      case PPage.wallet:
        return LocaleKeys.wallets.tr();
      case PPage.selectLanguage:
        return LocaleKeys.select_language.tr();
    }
  }
}
