import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ozare/features/search/models/team.dart';
import 'dart:convert';

import 'package:ozare/models/models.dart';

final Map<String, String> header = {
  'X-RapidAPI-Key': '07585b4120mshbc941a57c6ebd11p11de9bjsn089233df6ab2',
  'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com',
};

class SearchRepo {
  Future<List<Team>> getTeams(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api-football-v1.p.rapidapi.com/v3/teams?search=$query'),
        headers: header,
      );

      List<Team> parsedTeams = [];

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        final responses = responseMap['response'];

        log('results: ${responses.length.toString()}');

        // extract leagues
        for (final response in responses) {
          final teamResponse = response['team'] as Map<String, dynamic>;
          log('Team Response: ${teamResponse.toString()}');
          try {
            final Team team = Team.fromJson(teamResponse);
            parsedTeams.add(team);
          } catch (error) {
            continue;
          }
        }
      }
      return parsedTeams;
    } catch (error) {
      log('Error in search_repo: ${error.toString()}');
      rethrow;
    }
  }

  Future<Event?> getLiveMatchByTeam(int teamId) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://api-football-v1.p.rapidapi.com/v3/fixtures?live=all&team=$teamId'),
          headers: header);
      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

        if (responseMap['results'] < 1) return null;

        final responses = responseMap['response'] as List;
        if (responses.isEmpty) return null;

        final data = responses.first;

        // extract Event Fields
        final int id = data['fixutre']['id'];

        final int elapsedTime = data['fixture']['status']['elapsed'];
        final String team1 = data['teams']['home']['name'];
        final String logo1 = data['teams']['home']['logo'];
        final int id1 = data['teams']['home']['id'];

        final String team2 = data['teams']['away']['name'];
        final String logo2 = data['teams']['away']['logo'];
        final int id2 = data['teams']['away']['id'];

        final int score1 = data['goals']['home'];
        final int score2 = data['goals']['away'];

        // Event Object
        return Event(
          id: '$id',
          id1: '$id1',
          id2: '$id2',
          score1: '$score1',
          score2: '$score2',
          team1: team1,
          team2: team2,
          time: '$elapsedTime',
          logo1: logo1,
          logo2: logo2,
        );
      }
    } catch (error) {
      log('Error getting match by team id: ${error.toString()}');
    }
    return null;
  }
}
