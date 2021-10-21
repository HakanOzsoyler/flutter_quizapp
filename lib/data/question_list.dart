import 'package:flutter_quiz_app/models/questions.dart';

List<Question> questions = [
  Question(
      question: 'Art',
      answers: {'resim': true, 'matematik': false, 'müzik': false},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'Drama',
      answers: {'tarih': false, 'ingilizce': false, 'tiyatro': true},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'Geography',
      answers: {'okuma': false, 'coğrafya': true, 'fen': false},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'English',
      answers: {'ingilizce': true, 'resim': false, 'müzik': false},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'Reading',
      answers: {'yazma': false, 'okuma': true, 'matematik': false},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'Matsh',
      answers: {'müzik': false, 'resim': false, 'matematik': true},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'Music',
      answers: {'fen': false, 'resim': false, 'müzik': true},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'History',
      answers: {'tarih': true, 'matematik': false, 'fen': false},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'Writing',
      answers: {'ingilizce': false, 'okuma': false, 'yazma': true},
      optionsTitle: ['A', 'B', 'C']),
  Question(
      question: 'Science',
      answers: {'fen': true, 'tarih': false, 'matematik': false},
      optionsTitle: ['A', 'B', 'C']),
];
