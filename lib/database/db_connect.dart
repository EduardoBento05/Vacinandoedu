import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/questions_model.dart';

class DBconnect {
  Future<List<Question>> fetchQuestions(int nivel, int fase) async {
    final url = Uri.parse(
        'https://vacinandoedu-default-rtdb.firebaseio.com/questions.json');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<Question> newQuestions = [];

      data.forEach((key, value) {
        if (value['nivel'] == nivel && value['fase'] == fase) {
          var newQuestion = Question(
            id: key,
            nivel: value['nivel'],
            fase: value['fase'],
            title: value['title'],
            options: Map<String, bool>.from(
                value['options'] as Map<String, dynamic>),
          );

          newQuestions.add(newQuestion);
        }
      });

      return newQuestions;
    } else {
      throw Exception('Failed to fetch questions');
    }
  }
}
