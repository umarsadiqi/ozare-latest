import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ozare/features/search/models/team.dart';
import 'dart:convert';

class SearchRepo {
  final Map<String, String> header = {
    'X-RapidAPI-Key': '07585b4120mshbc941a57c6ebd11p11de9bjsn089233df6ab2',
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com',
  };

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
}
