import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ozare/models/models.dart';

class DashRepository {
  final String apiURl =
      'https://livescore6.p.rapidapi.com/matches/v2/list-live?Category=soccer';
  final String liveGamesEndPoint = 'list-live';
  final String logoBaseUrl = 'https://lsm-static-prod.livescore.com/medium/';

  final Map<String, String> header = {
    'X-RapidAPI-Key': '07585b4120mshbc941a57c6ebd11p11de9bjsn089233df6ab2',
    'X-RapidAPI-Host': 'livescore6.p.rapidapi.com',
  };

  Future<List<League>?> getLeagues() async {
    log("************* getLeagues() *************");
    final leagues = await _getLeagues();
    return leagues;
  }

  Future<List<League>?> _getLeagues() async {
    try {
      final response = await http.get(
        Uri.parse(apiURl),
        headers: header,
      );

      List<League> parsedLeagues = [];

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        final leagues = responseMap['Stages'];

        // extract leagues
        for (final l in leagues) {
          final events = l['Events'];
          final List<Event> parsedEvents = await _parseEvents(events);
          if (parsedEvents.isEmpty) continue;
          var league = League(
            id: l['Sid'] ?? '',
            name: l['Snm'] ?? '',
            events: parsedEvents,
          );

          parsedLeagues.add(league);
        }
      }
      return parsedLeagues;
    } catch (event) {
      log(event.toString());
      return null;
    }
  }

  _parseEvents(List<dynamic> events) {
    final List<Event> matches = [];
    for (final event in events) {
      try {
        final match = Event(
          id: event['Eid'] as String,
          team1: event['T1'][0]['Nm'] as String,
          team2: event['T2'][0]['Nm'] as String,
          id1: event['T1'][0]['ID'] as String,
          id2: event['T2'][0]['ID'] as String,
          logo1: logoBaseUrl + event['T1'][0]['Img'],
          logo2: logoBaseUrl + event['T2'][0]['Img'],
          score1: event["Tr1"] as String,
          score2: event["Tr2"] as String,
          time: (event["Eps"] as String).replaceAll('\'', ''),
        );
        matches.add(match);
      } catch (e) {}
    }
    return matches;
  }
}
