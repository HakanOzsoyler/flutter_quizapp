import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/word_list.dart';
import 'package:flutter_quiz_app/models/words.dart';

class WordSearch extends SearchDelegate<Word> {
  //arama yerini temizleme butonu
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  //geri gelme butonu
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.navigate_before));
  }

  // geri dönüş ekranı
  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        'Bu kelimeyi öğrenmediniz!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
    );
  }

  //arama yeri body
  @override
  Widget buildSuggestions(BuildContext context) {
    final listItem = query.isEmpty
        ? wordsList
        : wordsList
            .where((element) =>
                element.word!.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return listItem.isEmpty
        ? Center(
            child: Text('Veri bulunamadı!'),
          )
        : ListView.builder(
            itemCount: listItem.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  listItem.removeAt(index);
                },
                background: Container(
                  margin: EdgeInsets.only(top: 4, bottom: 4, left: 4),
                  alignment: Alignment.centerLeft,
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text('Silmek için kaydırın')
                      ],
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          showResults(context);
                        },
                        leading: Icon(Icons.translate),
                        title: Text(listItem[index].word.toString()),
                        subtitle: Text(listItem[index].meaning.toString()),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              );
            });
  }
}
