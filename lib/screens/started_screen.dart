import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_sqflite/functions.dart';
import 'package:quiz_sqflite/screens/create_quiz.dart';
import 'package:quiz_sqflite/screens/show_questions.dart';
import 'package:quiz_sqflite/screens/start_quiz.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                accountName: Text("Khaleel Mahdi"),
                accountEmail: Text("20202080")),
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
                  onPressed: () => navTo(context, StartQuizPage()),
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
