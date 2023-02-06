part of 'search_bloc.dart';

enum SearchStatus { none, loading, succeed, failure }

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.none,
    this.teams = const [],
    this.message = '',
    this.query = '',
  });

  final SearchStatus status;
  final List<Team> teams;
  final String message;
  final String query;

  SearchState copyWith({
    SearchStatus? status,
    List<Team>? teams,
    String? message,
    String? query,
  }) {
    return SearchState(
      teams: teams ?? this.teams,
      status: status ?? this.status,
      message: message ?? this.message,
      query: query ?? this.query,
    );
  }

  @override
  List<Object> get props => [status, teams, message, query];
}
