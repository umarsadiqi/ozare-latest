import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ozare/common/widgets/oval_clipper.dart';
import 'package:ozare/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/search/bloc/search_bloc.dart';
import 'package:ozare/translations/locale_keys.g.dart';

class UpperSection extends StatefulWidget {
  const UpperSection({
    super.key,
  });

  @override
  State<UpperSection> createState() => _UpperSectionState();
}

class _UpperSectionState extends State<UpperSection> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.22,
      width: size.width,
      child: Stack(children: [
        // Oval Bottom Clipper
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

        // Pattern Image
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'assets/images/pattern.png',
            color: Colors.white.withOpacity(0.11),
            width: size.width,
            height: size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),

        // Menu & Title
        Positioned(
            top: 46,
            right: 24,
            left: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white30,
                  child: Icon(
                    FontAwesome.award,
                    color: Colors.white,
                  ),
                ),

                Text(
                  'Ozare',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 32),

                // CircleAvatar(
                //   radius: 20,
                //   backgroundColor: Colors.white30,
                //   child: Icon(Icons.more_vert, color: Colors.white),
                // ),
              ],
            )),

        // SearchBar
        Positioned(
          top: size.height * 0.125,
          child: Container(
            height: 40,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return TextField(
                  scrollPadding: const EdgeInsets.only(left: 22),
                  textInputAction: TextInputAction.search,
                  cursorColor: Colors.grey[600],
                  controller: searchController,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12,
                  ),
                  onSubmitted: (value) {
                    if (searchController.text.isNotEmpty) {
                      context
                          .read<SearchBloc>()
                          .add(SearchRequested(searchController.text));
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 22),
                    hintText: LocaleKeys.search_teams.tr(),
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    fillColor: Colors.white.withOpacity(0.9),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(
                          color: primary2Color,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(
                          color: primary2Color,
                        )),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey[800]!,
                    ),
                    suffixIcon: state.status == SearchStatus.succeed
                        ? IconButton(
                            onPressed: () {
                              context.read<SearchBloc>().add(
                                  const SearchStatusChanged(SearchStatus.none));
                            },
                            icon: const Icon(Icons.close, color: Colors.grey))
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
