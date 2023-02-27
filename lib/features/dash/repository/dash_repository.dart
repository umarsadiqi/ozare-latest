import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ozare/models/models.dart';

class DashRepository {
  DashRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  final String apiURl =
      'https://livescore6.p.rapidapi.com/matches/v2/list-live?Category=';
  final String liveGamesEndPoint = 'list-live';
  final String logoBaseUrl = 'https://lsm-static-prod.livescore.com/medium/';

  final Map<String, String> header = {
    'X-RapidAPI-Key': '07585b4120mshbc941a57c6ebd11p11de9bjsn089233df6ab2',
    'X-RapidAPI-Host': 'livescore6.p.rapidapi.com',
  };

  Future<List<League>> getLeagues(String category) async {
    log("************* getLeagues($category) *************");
    final leagues = await _getLeagues(apiURl + category, category);
    return leagues;
  }

  Future<List<League>> _getLeagues(String url, String category) async {
    List<League> parsedLeagues = [];

    try {
      print('calling rapidapi');
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );



      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        final leagues = responseMap['Stages'];

        // extract leagues
        for (final l in leagues) {
          final events = l['Events'];
          final List<Event> parsedEvents = await _parseEvents(events, category);
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
      log('Error: $event');
      return parsedLeagues;
    }
  }

  _parseEvents(List<dynamic> events, String category) {
    final List<Event> matches = [];
    for (final event in events) {
      try {
        final match = Event(
          id: event['Eid'] as String,
          category: category,
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

  /// Get Stream of User's Bets
  Stream<List<Bet>> liveBetStream(String userId) {
    log('DashRepository: liveBetStream: $userId');
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('bets')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Bet.fromJson(doc.data())).toList();
    });
  }
}
