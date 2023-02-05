part of 'search_bloc.dart';

enum SearchStatus { initial, loading, succeed, failure }

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
  });

  final SearchStatus status;

  @override
  List<Object> get props => [status];
}
