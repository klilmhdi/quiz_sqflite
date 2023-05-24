import 'package:flutter/material.dart';
import '../model/model.dart';
import '../sqflite_option.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

Future addQuestion(QuizModel question) async {
  await SqliteServiceFunctions().createQuestion(question);
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final options = [
    {'value': 0, 'label': 'A'},
    {'value': 1, 'label': 'B'},
    {'value': 2, 'label': 'C'},
    {'value': 3, 'label': 'D'},
  ];

  late String title;
  final List<String> answers = ["", "", "", ""];
  late String correct = "0";
  late QuizModel question;

  void createQuizModel() {
    question = QuizModel(
      question: title,
      answers: answers,
      correctAnswerIndex: int.parse(correct),
      // dateTime: DateTime.now(),
    );
  }

  void submit() async {
    createQuizModel();
    await addQuestion(question);
    _formKey.currentState!.reset();
    scaffoldMessengerKey.currentState!.showSnackBar(
      const SnackBar(
        content: Text('Added successfully ✅'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.teal,
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create question for quiz'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.fromLTRB(12, 24, 12, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.grey, fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.question_mark),
                        labelText: 'Question',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.teal),
                        ),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter the question.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        title = value!;
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Text(
                                "A",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'First answer',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.teal),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter the first answer.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  answers[0] = value!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundColor: Colors.lightGreen,
                              child: Text(
                                "B",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Second answer',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.teal),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter the second answer.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  answers[1] = value!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              child: Text(
                                "C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Third answer',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.teal),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter the third answer.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  answers[2] = value!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Text(
                                "D",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Fourth answer',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.teal),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter the fourth answer.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  answers[3] = value!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Select the correct answer",
                          style: TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        Expanded(
                          child: DropdownButton<String>(
                              value: correct,
                              icon: const Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  correct = newValue!;
                                  print(correct);
                                });
                              },
                              items: options
                                  .map<DropdownMenuItem<String>>((option) {
                                return DropdownMenuItem<String>(
                                  value: option['value'].toString(),
                                  child: Text(option['label'].toString()),
                                );
                              }).toList()),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.teal),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 24)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            submit();
                          }
                        },
                        child: const Text(
                          "Add question",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ),
          )),
        ),
      ),
    );
  }
}
