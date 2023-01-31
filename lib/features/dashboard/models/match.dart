class Match {
  final String team1name;
  final String team2name;
  final String team1logo;
  final String team2logo;
  final String team1score;
  final String team2score;
  final String matchTime;

  Match({
    required this.team1name,
    required this.team2name,
    required this.team1logo,
    required this.team2logo,
    required this.team1score,
    required this.team2score,
    required this.matchTime,
  });

  @override
  String toString() {
    return 'Match(team1name: $team1name, team2name: $team2name, team1logo: $team1logo, team2logo: $team2logo, team1score: $team1score, team2score: $team2score, matchTime: $matchTime)';
  }
}
