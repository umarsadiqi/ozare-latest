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

  Future<List<Match?>?> getMatchList() async {
    try {
      final response = await http.get(
        Uri.parse(apiURl),
        headers: header,
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        log('responseMap Type: ${responseMap.runtimeType}');
        final stages = responseMap['Stages'];
        log('stages Type: ${stages.runtimeType}, length: ${stages.length}');
        for (final stage in stages) {
          final events = stage['Events'];
          log('events Type: ${events.runtimeType}, length: ${events.length}');
          _getMatchesFromEvents(events);
        }
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  _getMatchesFromEvents(List<dynamic> events) {
    log("${events.runtimeType} - ${events.length}");

    for (final event in events) {
      log('event Type: ${event.runtimeType}');
      log(event.toString());
      final e = jsonDecode(event.toString()) as Map<String, dynamic>;
      log(e.runtimeType.toString());
      final match = Match(
        team1name: e['T1'][0]['Nm'] as String,
        team2name: e['T2'][0]['Nm'] as String,
        team1logo: logoBaseUrl + e['T1'][0]['Img'],
        team2logo: logoBaseUrl + e['T2'][0]['Img'],
        team1score: e["Tr1"] as String,
        team2score: e["Tr2"] as String,
        matchTime: '',
      );
      log(match.team1name);
    }

    // final List<Match?> matches = [];
    // events.map((e) {
    //   log('e Type: ${e.runtimeType}');
    //   try {
    //     e = jsonDecode(e);
    //     log(e.runtimeType.toString());
    //     final match = Match(
    //       team1name: e['T1'][0]['Nm'] as String,
    //       team2name: e['T2'][0]['Nm'] as String,
    //       team1logo: logoBaseUrl + e['T1'][0]['Img'],
    //       team2logo: logoBaseUrl + e['T2'][0]['Img'],
    //       team1score: e["Tr1"] as String,
    //       team2score: e["Tr2"] as String,
    //       matchTime: '',
    //     );
    //     matches.add(match);
    //   } catch (e) {}
    // });

    // log(matches.runtimeType.toString() + matches.length.toString());
    // matches.removeWhere((element) => element == null);
    // log(matches.runtimeType.toString() + matches.length.toString());
    // matches.map((e) => log(e!.team1name));
    //final matches = matchFromJson(response.body);
  }
}
