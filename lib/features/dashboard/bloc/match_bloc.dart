import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ozare/features/dashboard/models/match.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(MatchState(status: MatchStatus.loading)) {
    on<MatchListRequested>(_onMatchListRequested);
  }

  final String apiURl = 'https://livescore6.p.rapidapi.com/matches/v2/';
  final String liveGamesEndPoint = 'list-live';
  final String logoBaseUrl = 'https://lsm-static-prod.livescore.com/medium/';

  final Map<String, String> header = {
    'X-RapidAPI-Key': '6190ca4df7msh6635b430765a458p16c2b5jsn706049e663d1',
    'X-RapidAPI-Host': 'livescore6.p.rapidapi.com',
  };

  void _onMatchListRequested(
    MatchListRequested event,
    Emitter<MatchState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MatchStatus.loading));

      final response = await http.get(
        Uri.parse(apiURl + liveGamesEndPoint),
        headers: header,
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        final stages = responseMap['Stages'];
        final events = stages[0]['Events'];
        log("${events.runtimeType} - ${events.length}");

        final matches = events.map((e) {
          e = e as Map<String, dynamic>;
          return Match(
            team1name: e['T1'][0]['Nm'] as String,
            team2name: e['T2'][0]['Nm'] as String,
            team1logo: logoBaseUrl + e['T1'][0]['Img'],
            team2logo: logoBaseUrl + e['T2'][0]['Img'],
            team1score: e["Tr1"] as String,
            team2score: e["Tr2"] as String,
            matchTime: '',
          );
        }).toList();

        log(matches.length.toString());
        //final matches = matchFromJson(response.body);
        emit(state.copyWith(status: MatchStatus.success));
      } else {
        emit(state.copyWith(status: MatchStatus.failure));
      }

      // emit(state.copyWith(matches: matches, status: MatchStatus.success));
    } catch (_) {
      emit(state.copyWith(status: MatchStatus.failure));
    }
  }
}
