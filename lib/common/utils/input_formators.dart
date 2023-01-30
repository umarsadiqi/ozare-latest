import 'package:flutter/services.dart';

class InputFormators {
  static final spaceNotAllowed =
      FilteringTextInputFormatter.deny(RegExp(r'\s'));
}
