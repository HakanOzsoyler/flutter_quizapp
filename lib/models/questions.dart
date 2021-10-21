import 'package:flutter/cupertino.dart';

class Question {
  final String? question;

  Map<String, bool>? answers;
  final List<String>? optionsTitle;
  Question(
      {@required this.question,
      @required this.answers,
      @required this.optionsTitle});
}
