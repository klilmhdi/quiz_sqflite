import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_sqflite/functions.dart';
import 'package:quiz_sqflite/model/model.dart';
import 'package:quiz_sqflite/screens/create_quiz.dart';
import 'package:quiz_sqflite/screens/show_questions.dart';
import 'package:quiz_sqflite/screens/start_quiz.dart';
import 'package:quiz_sqflite/sqflite_option.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  Future<List<QuizModel>> getQuestion() async =>
      await SqliteServiceFunctions().getQuestions();

  List<QuizModel> listData = [];
  Future<void> getListData() async {
    final result = await getQuestion();
    listData = [];
    listData.addAll(result);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    getListData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Quiz app",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                currentAccountPicture: CircleAvatar(
                  child: Text("A",
                      style: TextStyle(color: Colors.white, fontSize: 35.0)),
                  backgroundColor: Colors.red,
                ),
                accountName: Text("Hello World"),
                accountEmail: Text("20")),
            ListTile(
              onTap: () => navTo(context, ShowQuestions()),
              leading: Icon(CupertinoIcons.pen, color: Colors.black87),
              title: Text("Create Quiz",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: ()=> navTo(context, StartQuizPage()),
              leading: Icon(Icons.info, color: Colors.black87),
              title: Text("Start Quiz",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
            ),
            Divider(
              color: Colors.black87,
            ),
            ListTile(
              onTap: () => exitApp(),
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text("Exit",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz.png'),
            Container(
              width: 240.0,
              height: 60.0,
              child: ElevatedButton(
                  onPressed: () => listData.length < 5 ? showDialog(
                    // title:
                    context: context ,
                    builder: (context) => Center(
                      child: Container(
                        height: 150.0,
                        width: 260.0,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                  child: Text("You should add more than 4 questions",
                                      style: TextStyle(color: Colors.teal, fontSize: 25.0)),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                                  child: const Text("Add question",
                                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                                  onPressed: () => navTo(context, CreateQuiz()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) : navTo(context, StartQuizPage()),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  ),
                  child: Text("Start Quiz",
                      style: TextStyle(color: Colors.white, fontSize: 35.0))),
            )
          ],
        ),
      ),
    );
  }
}
