// import 'package:flutter/material.dart';
// import 'package:quiz_sqflite/model/model.dart';
// import 'package:quiz_sqflite/screens/started_screen.dart';
// import 'package:quiz_sqflite/sqflite_option.dart';
//
// import '../functions.dart';
//
// class StartQuizPage extends StatefulWidget {
//   const StartQuizPage({Key? key}) : super(key: key);
//
//   @override
//   State<StartQuizPage> createState() => _StartQuizPageState();
// }
//
// class _StartQuizPageState extends State<StartQuizPage> {
//   Future<List<QuizModel>> getQuiz() async => await SqliteServiceFunctions().getQuestions();
//   // int currentQuestionIndex = 0;
//   // int score = 0;
//   // var selectedAnswer;
//
//   List<QuizModel> quizList = [];
//
//   Future<void> getQuizData() async {
//     final result = await getQuiz();
//     quizList = [];
//     quizList.addAll(result);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     getQuizData();
//     print(quizList[0].answers);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () => navAndFinish(context, StartedPage()),
//             color: Colors.white,
//             icon: Icon(Icons.arrow_back)),
//         backgroundColor: Colors.teal,
//         title: Text("Quiz app",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold)),
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 flex: 10,
//                 child: Container(
//                   width: double.infinity,
//                   height: 200.0,
//                   child: ListView.builder(
//                       itemCount: quizList.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Center(
//                                   // child: Text(
//                                   //   "Question ${currentQuestionIndex + 1}/${quizList.length.toString()}",
//                                   //   style: const TextStyle(
//                                   //     color: Colors.black87,
//                                   //     fontSize: 20,
//                                   //     fontWeight: FontWeight.w600,
//                                   //   ),
//                                   // ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 // for questions
//                                 Container(
//                                   alignment: Alignment.center,
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.all(32),
//                                   decoration: BoxDecoration(
//                                     color: Colors.teal,
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                   child: Text(
//                                     quizList[index].question,
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             // for answers
//                             // Column(
//                             //   children: quizList[index].answers.map(
//                             //         (e) {
//                             //       var isSelected = e == selectedAnswer;
//                             //       return Container(
//                             //         width: double.infinity,
//                             //         margin: const EdgeInsets.symmetric(vertical: 8),
//                             //         height: 48,
//                             //         child: ElevatedButton(
//                             //           child: Text(e,
//                             //               style: TextStyle(
//                             //                   color: isSelected ? Colors.white : Colors.black,
//                             //                   fontSize: 18.0)),
//                             //           style: ElevatedButton.styleFrom(
//                             //               shape: StadiumBorder(
//                             //                   side: BorderSide(
//                             //                       color: isSelected ? Colors.white : Colors.teal)),
//                             //               backgroundColor: isSelected ? Colors.teal : Colors.white),
//                             //           onPressed: () {
//                             //             // if (selectedAnswer == null) {
//                             //             //   if (e.isNotEmpty) {
//                             //             //     score++;
//                             //             //   }
//                             //             //   setState(() {
//                             //             //     selectedAnswer = e;
//                             //             //   });
//                             //             // }
//                             //           },
//                             //         ),
//                             //       );
//                             //     },
//                             //   ).toList(),
//                             // ),
//                           ],
//                         );
//                       }
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: _nextButton(),
//               )
//             ]),
//       ),
//     );
//   }
//
//   _nextButton() {
//     bool isLastQuestion = false;
//     // if (currentQuestionIndex == quizList.length - 1) {
//     //   isLastQuestion = true;
//     // }
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.5,
//       height: 48,
//       child: ElevatedButton(
//         child: Text(isLastQuestion ? "Submit" : "Next",
//             style: TextStyle(color: Colors.white, fontSize: 18.0)),
//         style: ElevatedButton.styleFrom(
//             shape: const StadiumBorder(), backgroundColor: Colors.teal),
//         onPressed: () {
//           if (isLastQuestion) {
//             showDialog(context: context, builder: (_) => _showScoreDialog());
//           } else {
//             setState(() {
//               // currentQuestionIndex++;
//             });
//           }
//         },
//       ),
//     );
//   }
//
//   _showScoreDialog() {
//     bool isPassed = false;
//
//     // if (score >= quizList.length * 0.5) {
//     //   isPassed = true;
//     // }
//     String title = isPassed ? "Passed " : "Failed";
//
//     return AlertDialog(
//       // title:
//       title: Center(
//           child: Text(isPassed ? "Congratulations!" : "Oops!",
//               style: TextStyle(color: Colors.teal, fontSize: 25.0))),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           isPassed
//               ? ClipRRect(
//                   borderRadius: BorderRadius.circular(20.0),
//                   child: Image.asset("assets/images/result.jpg"))
//               : Image.asset("assets/images/fail.png"),
//           SizedBox(height: 10.0),
//           // Text(
//           //   "Your Score : $score / ${quizList.length}",
//           //   style: TextStyle(
//           //       color: Colors.green,
//           //       fontWeight: FontWeight.bold,
//           //       fontSize: 20.0),
//           // ),
//           SizedBox(height: 15.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(Colors.teal)),
//                 child: const Text("Restart",
//                     style: TextStyle(color: Colors.white, fontSize: 16.0)),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   // setState(() {
//                   //   currentQuestionIndex = 0;
//                   //   score = 0;
//                   //   selectedAnswer = null;
//                   // });
//                 },
//               ),
//               ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(Colors.teal)),
//                 child: const Text("Go back to home",
//                     style: TextStyle(color: Colors.white, fontSize: 16.0)),
//                 onPressed: () => navAndFinish(context, StartedPage()),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quiz_sqflite/functions.dart';
import 'package:quiz_sqflite/model/model.dart';
import 'package:quiz_sqflite/screens/create_quiz.dart';
import 'package:quiz_sqflite/screens/started_screen.dart';
import 'package:quiz_sqflite/sqflite_option.dart';

class StartQuizPage extends StatefulWidget {
  const StartQuizPage({Key? key}) : super(key: key);

  @override
  State<StartQuizPage> createState() => _StartQuizPageState();
}

class _StartQuizPageState extends State<StartQuizPage> {
  Future<List<QuizModel>> getQuestion() async =>
      await SqliteServiceFunctions().getQuestions();

  int score = 0;
  int isSelected = -1;
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
                flex: 12,
                child: ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) {
                      final QuizModel data = listData[index];
                      final String question = data.question;
                      final List<String> answers = data.answers;
                      final int? id = data.id;
                      final int correct = data.correctAnswerIndex;
                      var questionLength = question.length;
                      return Column(
                        children: [
                          SizedBox(height: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // for question counter
                              Center(
                                child: Text(
                                  "Question ${index + 1}/${listData.length}",
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              // for questions
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                padding: const EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  question,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: answers.asMap().entries.map(
                                  (MapEntry<int, String> entry) {
                                int index = entry.key;
                                String e = entry.value;
                                return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  height: 48,
                                  child: ElevatedButton(
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: isSelected < -1 ? Colors.white : Colors.black,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(
                                        side: BorderSide(
                                          color: isSelected < -1 ? Colors.white : Colors.teal,
                                        ),
                                      ),
                                      backgroundColor: isSelected < -1 ? Colors.teal : Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isSelected = index;
                                        score++;
                                        print(isSelected);
                                      });
                                    },
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          SizedBox(height: 30.0),
                        ],
                      );
                    }),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 48,
                  child: ElevatedButton(
                      child: Text("Submit",
                          style: TextStyle(color: Colors.white, fontSize: 18.0)),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(), backgroundColor: Colors.teal),
                      onPressed: () =>
                          showDialog(context: context, builder: (_) {
                            bool isPassed = false;
                            if (score >= listData.length * 0.5) {
                              isPassed = true;
                            }
                            String title = isPassed ? "Passed " : "Failed";

                            return AlertDialog(
                              // title:
                              title: Center(
                                  child: Text(isPassed ? "Congratulations!" : "Oops!",
                                      style: TextStyle(color: Colors.teal, fontSize: 25.0))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isPassed
                                      ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset("assets/images/result.jpg"))
                                      : Image.asset("assets/images/fail.png"),
                                  SizedBox(height: 10.0),
                                  Text(
                                    "Your Score : $score / ${listData.length}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(height: 15.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                                        child: const Text("Restart",
                                            style: TextStyle(color: Colors.white, fontSize: 16.0)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            score = 0;
                                            isSelected = -1;
                                          });
                                        },
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                                        child: const Text("Go back to home",
                                            style: TextStyle(color: Colors.white, fontSize: 16.0)),
                                        onPressed: () => navAndFinish(context, StartedPage()),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          })),
                ),
              )
            ])));
  }
}
