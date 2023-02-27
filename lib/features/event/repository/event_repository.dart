import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ozare/models/models.dart';
import 'package:http/http.dart' as http;

class EventRepository {
  EventRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  final String apiURl =
      'https://livescore6.p.rapidapi.com/matches/v2/get-scoreboard';
  final String logoBaseUrl = 'https://lsm-static-prod.livescore.com/medium/';

  final Map<String, String> header = {
    'X-RapidAPI-Key': '07585b4120mshbc941a57c6ebd11p11de9bjsn089233df6ab2',
    'X-RapidAPI-Host': 'livescore6.p.rapidapi.com',
  };

  // create new document with id of the event in events collection
  Future<void> initializeEvent(Event event) async {
    await _firestore.collection('events').doc(event.id).set(event.toJson());
  }

  // get event scoreboard from livescore api
  Future<Event?> getEventScoreboard({
    /// event id
    required String eid,

    /// category: e.g, soccer, basketball
    required String category,
  }) async {
    log('************* getEventScoreboard($eid, $category) *************');
    try {
      print('calling rapidapi');
      final response = await http.get(
        Uri.parse('$apiURl?Category=$category&Eid=$eid'),
        headers: header,
      );

      if (response.statusCode == 200) {
        final event = jsonDecode(response.body) as Map<String, dynamic>;
        final match = Event(
          category: category,
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
        return match;
      }
      return null;
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }
}
