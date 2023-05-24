import 'package:quiz_sqflite/model/model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqliteServiceFunctions {
  Future<void> createTables(sql.Database database) async {
    await database.execute(
      """CREATE TABLE QuizQuestions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            answers TEXT NOT NULL,
            correctAnswerIndex INTEGER NOT NULL,
            createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
            )""",
    );
  }

  Future<sql.Database> db() async {
    return sql.openDatabase('quiz.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    }, onOpen: (db) {
      print("DB Opened");
    });
  }

  // Create new question
  Future<int> createQuestion(QuizModel quizQuestion) async {
    final db = await SqliteServiceFunctions().db();
    final id = await db.insert('QuizQuestions', quizQuestion.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  // Get all questions
  Future<List<QuizModel>> getQuestions() async {
    final db = await SqliteServiceFunctions().db();
    final List<Map<String, Object?>> queryResult =
        await db.query('QuizQuestions', orderBy: 'id');
    return queryResult.map((e) => QuizModel.fromMap(e)).toList();
  }

  // Delete question by id
  Future<void> deleteQuestion(int id) async {
    final db = await SqliteServiceFunctions().db();
    try {
      await db.delete("QuizQuestions", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
