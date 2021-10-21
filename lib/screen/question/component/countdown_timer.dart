import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/question_list.dart';

class CountDownTimer extends StatelessWidget {
  final index;
  final Function fNextPage;
  final List<String>? consFalseAns;
  final Function searchAdd;
  const CountDownTimer(
      {Key? key,
      @required this.index,
      required this.fNextPage,
      @required this.consFalseAns,
      required this.searchAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 50),
      child: CircularCountDownTimer(
        initialDuration: 0,
        height: MediaQuery.of(context).size.width / 4,
        width: MediaQuery.of(context).size.height / 4,
        textStyle: TextStyle(color: Colors.white, fontSize: 40),
        isTimerTextShown: true,
        isReverse: true,
        fillColor: Colors.lightBlue,
        ringColor: Colors.black38,
        backgroundColor: Colors.black54,
        duration: 10,
        controller: CountDownController(),
        onComplete: () {
          searchAdd(index);
          fNextPage(index);
          consFalseAns!.add(questions[index].question!.toString());
        },
      ),
    );
  }
}
