part of 'search_bloc.dart';

enum SearchStatus { none, loading, succeed, failure }

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.none,
  });

  final SearchStatus status;

  @override
  List<Object> get props => [status];
}
