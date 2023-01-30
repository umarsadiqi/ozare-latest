import 'dart:developer';
import 'package:ozare/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// LocalDBRepository
class LocalDBRepository {
  final SharedPreferences _sharedPreferences;

  LocalDBRepository({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  // save onboard status
  Future<void> saveOnboardStatus(bool status) async {
    log("Saving onboard status: $status");
    await _sharedPreferences.setBool(SFKeys.onboard, status);
  }

  // get onboard status
  bool? getOnboardStatus() {
    log("Getting onboard status ...");
    final bool? status = _sharedPreferences.getBool(SFKeys.onboard);
    return status;
  }

  // save user
  Future<void> saveOwner(OUser owner) async {
    // log("Saving Owner: ${owner.toJson()}");
    // await _sharedPreferences.setString(SFKeys.user, owner.toJson());
  }

  // get user
  OUser? getOwner() {
    log("Getting Owner ...");
    final String? user = _sharedPreferences.getString(SFKeys.user);
    if (user != null) {
      return OUser.fromJson(user as Map<String, dynamic>);
    }
    return null;
  }
}

////////////////////////////////
/// LocalDB Constants
class SFKeys {
  static const String onboard = 'onboard';
  static const String user = 'user';
}
