import 'package:flutter/material.dart';
import 'package:quiz_sqflite/functions.dart';
import 'package:quiz_sqflite/model/model.dart';
import 'package:quiz_sqflite/screens/create_quiz.dart';
import 'package:quiz_sqflite/screens/started_screen.dart';
import 'package:quiz_sqflite/sqflite_option.dart';

class ShowQuestions extends StatefulWidget {
  const ShowQuestions({Key? key}) : super(key: key);

  @override
  State<ShowQuestions> createState() => _ShowQuestionsState();
}

class _ShowQuestionsState extends State<ShowQuestions> {
  Future<List<QuizModel>> getQuestion() async =>  await SqliteServiceFunctions().getQuestions();

  Future<void> deleteQuestion(int? id) async => await SqliteServiceFunctions().deleteQuestion(id!);

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
        centerTitle: true,
        leading: IconButton(
            onPressed: () => navAndFinish(context, StartedPage()),
            color: Colors.white,
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal,
        title: Text("Create Quiz",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: 260.0,
                  height: 30.0,
                  child: ElevatedButton(
                      onPressed: () => navTo(context, CreateQuiz()),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.teal),
                      ),
                      child: Text("Add Question",
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.0))),
                ),
              ),
            ),
            Expanded(flex: 1, child: Center(child: Text("The question current now is: ${listData.length}", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),))),
            Expanded(
              flex: 12,
              child: listData.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(height: 90.0),
                          Image.asset('assets/images/faq.png'),
                          Text(
                              "There's no questions here, add one from Add Answer button",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: listData.length,
                      itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[400]),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(32),
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Text(
                                            listData[index].question,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: IconButton(
                                                onPressed: () async{
                                                  return showDialog(
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
                                                                  child: Text("Do you want to delete this question?",
                                                                      style: TextStyle(color: Colors.teal, fontSize: 25.0)),
                                                                )),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                                                                  child: const Text("No",
                                                                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                                                                  onPressed: () => Navigator.pop(context),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                                                                  child: const Text("Yes",
                                                                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                                                                  onPressed: () {
                                                                    final id = listData[index].id;
                                                                    deleteQuestion(id!);
                                                                    Navigator.pop(context);
                                                                    SnackBar(content: Text("Deleted Successfully ✅"));
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    context: context
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                height: 48,
                                child: ElevatedButton(
                                  child: Text(listData[index].answers[0],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0)),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(
                                          side: BorderSide(color: Colors.teal)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                height: 48,
                                child: ElevatedButton(
                                  child: Text(listData[index].answers[1],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0)),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(
                                          side: BorderSide(color: Colors.teal)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                height: 48,
                                child: ElevatedButton(
                                  child: Text(listData[index].answers[2],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0)),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(
                                          side: BorderSide(color: Colors.teal)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                height: 48,
                                child: ElevatedButton(
                                  child: Text(listData[index].answers[3],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0)),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(
                                          side: BorderSide(color: Colors.teal)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 4.0),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
