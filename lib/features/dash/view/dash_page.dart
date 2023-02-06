import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/features/dash/view/dash_view.dart';
import 'package:ozare/features/search/bloc/search_bloc.dart';

class DashPage extends StatelessWidget {
  const DashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final searchStatus = state.status;
          switch (searchStatus) {
            case SearchStatus.none:
              return const DashView();

            case SearchStatus.loading:
              return const Loader(message: 'searching ...');
            case SearchStatus.succeed:
              return const Loader(message: 'succeed');
            case SearchStatus.failure:
              return const Loader(message: 'failure');
          }
        },
      ),
    );
  }
}
