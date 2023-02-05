import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/features/search/bloc/search_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final status = state.status;
        if (status == SearchStatus.loading) {
          return const Loader(message: 'searching ...');
        } else if (status == SearchStatus.succeed) {}
        return const Loader(message: 'loading ...');
      },
    );
  }
}
