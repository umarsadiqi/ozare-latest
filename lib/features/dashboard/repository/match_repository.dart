import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ozare/features/dashboard/models/match.dart';

class MatchRepository {
  final String apiURl =
      'https://livescore6.p.rapidapi.com/matches/v2/list-live?Category=soccer';
  final String liveGamesEndPoint = 'list-live';
  final String logoBaseUrl = 'https://lsm-static-prod.livescore.com/medium/';

  final Map<String, String> header = {
    'X-RapidAPI-Key': '6190ca4df7msh6635b430765a458p16c2b5jsn706049e663d1',
    'X-RapidAPI-Host': 'livescore6.p.rapidapi.com',
  };

  Future<List<Match>?> getMatchList() async {
    try {
      final response = await http.get(
        Uri.parse(apiURl),
        headers: header,
      );

      final List<Match> allMatches = [];

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        final stages = responseMap['Stages'];
        for (final stage in stages) {
          final events = stage['Events'];
          final List<Match> matches = await _getMatchesFromEvents(events);
          allMatches.addAll(matches);
        }
      }
      return allMatches;
    } catch (event) {
      log(event.toString());
      return null;
    }
  }

  _getMatchesFromEvents(List<dynamic> events) {
    final List<Match> matches = [];
    for (final event in events) {
      try {
        final match = Match(
          team1name: event['T1'][0]['Nm'] as String,
          team2name: event['T2'][0]['Nm'] as String,
          team1logo: logoBaseUrl + event['T1'][0]['Img'],
          team2logo: logoBaseUrl + event['T2'][0]['Img'],
          team1score: event["Tr1"] as String,
          team2score: event["Tr2"] as String,
          matchTime:
              (event["Eps"] as String).replaceAll('\'', '').replaceAll('+', ''),
        );
        matches.add(match);
        log(match.toString());
      } catch (e) {}
    }
    return matches;
  }
}
