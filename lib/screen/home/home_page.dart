import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screen/home/component/MyCard.dart';
import 'package:flutter_quiz_app/screen/word_add/word_add.dart';

import 'component/my_divider.dart';
import 'component/word_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Uygulama ismi'),
        actions: [
          //arama butounu
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: WordSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          //ara çizgi
          MyDivider(),
          //soru sayfasına gidiş
          Expanded(
            flex: 1,
            child: Row(
              children: [
                MyCard(
                  title: 'Okul',
                  icon: Icons.school,
                ),
                MyCard(
                  title: 'Yüzümüz',
                  icon: Icons.face_retouching_natural,
                )
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          //kelime ekleme sayfasına gidiş
          Expanded(
            flex: 1,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WordAdd()));
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[700],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add_circle,
                      size: 60,
                    ),
                    Text(
                      'Kelime Ekle',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
