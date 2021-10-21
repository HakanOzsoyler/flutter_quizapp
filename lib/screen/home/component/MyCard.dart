import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screen/question/question_page.dart';

class MyCard extends StatelessWidget {
  final String? title;
  final IconData? icon;

  const MyCard({
    Key? key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuestionPage())),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon,
                size: 80,
                color: Colors.black,
              ),
              Text(title!,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}
