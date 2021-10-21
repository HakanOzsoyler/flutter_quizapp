import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/word_list.dart';
import 'package:flutter_quiz_app/models/words.dart';

class WordAdd extends StatefulWidget {
  @override
  _WordAddState createState() => _WordAddState();
}

class _WordAddState extends State<WordAdd> {
  String? ingWord, meaning;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.add),
        onPressed: _girilenBilgileriOnayla,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.translate),
                    labelText: 'İngilice Kelime',
                    hintText: 'İngilizce kelime giriniz.',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  validator: wordkontrol,
                  onSaved: (deger) => ingWord = deger,
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.translate),
                    labelText: 'Kelime Anlamı',
                    hintText: 'Kelime anlamını giriniz.',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  validator: wordkontrol,
                  onSaved: (deger) => meaning = deger,
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.save), Text('Kaydet')],
                    ),
                    onPressed: _girilenBilgileriOnayla,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? wordkontrol(String? value) {
    RegExp regex = RegExp("^[a-z A-Z üğişçöÜĞİŞÇÖ]+\$");
    if (value == null) {
      return '';
    } else if (value.length < 1) {
      return 'Boş bırakılmamalı';
    } else if (!regex.hasMatch(value)) {
      return 'rakam içermemeli';
    }
  }

  void _girilenBilgileriOnayla() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      debugPrint(
          ' Girilen ingilizce kelime:$ingWord\n Girilen anlamı:$meaning');
      wordsList.add(Word(word: ingWord, meaning: meaning));
      Navigator.pop(context);
    }
  }
}
