import 'package:flutter/material.dart';

class ScorPage extends StatelessWidget {
  final int? score;
  final List<String>? yanlisCevapEkle2;
  const ScorPage(
      {Key? key, @required this.score, @required this.yanlisCevapEkle2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tebrikler Puanınız ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Divider(
              color: Colors.blue,
              indent: 10,
              endIndent: 10,
              thickness: 2,
            ),
            Text(
              score.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                  color: Colors.blue),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Yanlış cevapladığınız kelimeler',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  for (int i = 0; i < yanlisCevapEkle2!.length; i++)
                    Text(
                      yanlisCevapEkle2![i],
                      style: TextStyle(fontSize: 18),
                    ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 10),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('Ana Sayfa')),
            )
          ],
        ),
      ),
    );
  }
}
