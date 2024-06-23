import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../constants.dart';
import '../../../database/db.dart';
import 'questions_model.dart';
import '../../../models/next_button.dart';
import 'options_card.dart';
import 'questions_widget.dart';
import 'result_box.dart';
import '../../home/pages/initial_page.dart';

class QuestionPage extends StatefulWidget {
  final int level;
  final int stage;

  const QuestionPage(this.level, this.stage);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late List<Question> extractedData;

  //DBconnect db = DBconnect();

  late Future _questions;

  Future<List<Question>> getData() async {
    Database db = await DB.instance.database;
    List<Map<String, dynamic>> result = await db.query('questions');

    List<Question> extractedData = [];
    for (Map<String, dynamic> row in result) {
      if (row.containsKey('id') &&
          row.containsKey('nivel') &&
          row.containsKey('fase') &&
          row.containsKey('title') &&
          row.containsKey('options')) {
        Question pergunta = Question.fromMap(row);
        if (pergunta.nivel == widget.level && pergunta.fase == widget.stage) {
          extractedData.add(pergunta);
        }
      }
    }

    return extractedData;
  }

  @override
  void initState() {
    super.initState();

    _questions = getData();
  }

  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected = false;

  void nextQuestion(int questionLenght) {
    if (index == questionLenght - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ResultBox(
          result: score,
          questionLenght: questionLenght,
          onPressed: startOver,
          nivel: widget.level,
          fase: widget.stage,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Por favor, selecione uma opção"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }

      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: grayHighlight,
                shadowColor: Colors.grey[400],
                centerTitle: true,
                title: Text(
                  "stage - " + widget.stage.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Pontos: $score",
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  )
                ],
              ),
              drawer: Drawer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        blueStart,
                        purpleEnd,
                      ],
                    ),
                  ),
                  child: ListView(
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Text(
                          'Níveis',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Pagina Inicial '),
                        leading: Icon(Icons.home),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InitialPage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    blueStart,
                    purpleEnd,
                  ],
                )),
                width: double.infinity,
                child: Column(
                  children: [
                    QuestionsWidget(
                      question: extractedData[index].title,
                      indexAction: index,
                      totalQuestions: extractedData.length,
                    ),
                    const Divider(color: neutral),
                    const SizedBox(height: 25.0),
                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                          extractedData[index].options.values.toList()[i] ==
                              true,
                        ),
                        child: OptionsCard(
                          options:
                              extractedData[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractedData[index]
                                          .options
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : neutral,
                        ),
                      )
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                const SizedBox(height: 20.0),
                Text(
                  'Carregando Questões..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text("No Data"),
        );
      },
    );
  }
}
