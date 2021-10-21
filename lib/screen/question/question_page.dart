import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/question_list.dart';
import 'package:flutter_quiz_app/data/word_list.dart';
import 'package:flutter_quiz_app/models/words.dart';
import 'package:flutter_quiz_app/screen/scor/scor_page.dart';

import 'component/countdown_timer.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isFalse = Colors.red;
  Color isStable = Colors.grey;
  IconData isTrueIcon = Icons.done;
  IconData isFalseIcon = Icons.close;
  int score = 0;
  List<String> falseAns = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // geri sayım aracı
                Expanded(
                  child: CountDownTimer(
                    index: index,
                    fNextPage: nextPage,
                    searchAdd: searchListAdd,
                    consFalseAns: falseAns,
                  ),
                ),
                //hangi soruda olduğumuzu göster
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  width: double.infinity,
                  child: Text(
                    'Soru ${index + 1} /${questions.length}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                    ),
                  ),
                ),
                //ara çizgi
                Divider(
                  thickness: 2,
                  height: 10,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.blue[500],
                ),
                //sorularımız burada yer alıyor
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 30, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        questions[index].question!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                //şıklarımız burada yer alıyor
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isPressed = true;
                        });
                        if (questions[index]
                            .answers!
                            .entries
                            .toList()[i]
                            .value) {
                          score += 10;

                          print(score);
                        } else {
                          searchListAdd(index);
                          falseAns.add(questions[index].question!.toString());
                          print(falseAns.toString());
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.transparent,
                            border: Border.all(
                                color: isPressed
                                    ? questions[index]
                                            .answers!
                                            .entries
                                            .toList()[i]
                                            .value
                                        ? isTrue
                                        : isFalse
                                    : isStable,
                                width: 1.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.grey),
                                color: isPressed
                                    ? questions[index]
                                            .answers!
                                            .entries
                                            .toList()[i]
                                            .value
                                        ? isTrue
                                        : isFalse
                                    : Colors.transparent,
                              ),
                              child: Center(
                                  child: Text(questions[index]
                                      .optionsTitle![i]
                                      .toString())),
                            ),
                            SizedBox(width: 10),
                            Text(
                              questions[index].answers!.keys.toList()[i],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                // Sonraki soru butonu
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 10),
                    onPressed: isPressed
                        ? () {
                            nextPage(index);
                          }
                        : null,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Text(
                        index + 1 == questions.length
                            ? 'Skorunuz'
                            : 'Sonraki soru',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  void nextPage(index) {
    if (questions.length == index + 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScorPage(
                  yanlisCevapEkle2: falseAns,
                  score: score,
                )),
      );
    } else {
      _controller!.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
    }
  }

  searchListAdd(index) {
    questions[index].answers!.forEach((key, value) {
      if (value == true) {
        wordsList.add(Word(word: questions[index].question!, meaning: key));
      }
    });
  }
}
