import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ozare/consts.dart';
import 'dart:convert';
import 'package:ozare/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TonkeeperRepository {
  final String apiURl =
      'https://tonapi.io/v1/';
  final String tonkeeperToken = 'oauth/getToken';


  Future<bool> getToken(String severToken) async {
    log("************* get Tonkeeper token() *************");
    try {
      final response = await http.get(
        Uri.parse(apiURl+tonkeeperToken),
        headers: {
            'Authorization':'Bearer $severToken'
        },
      );

      List<League> parsedLeagues = [];

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        final persistentToken = responseMap['user_token'];
        var sp = await SharedPreferences.getInstance();
        sp.setString(tonkeeperAuthKey, persistentToken);
        return true;
      }
      return false;
    } catch (event) {
      return false;
    }
  }

}
