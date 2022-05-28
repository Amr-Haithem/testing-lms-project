import 'package:sqflite/sqflite.dart';
import 'package:testing_project/data/local_db/lms_db.dart';

class ProfessorSink {
  final LmsDB _lmsDB = LmsDB();
  Future<List<Map<String, Object?>>> getProfessor( String userName, String password) async {
    Database db = await _lmsDB.database;
    return await db.query('professor',
        where: 'user_name=$userName AND password = $password');
  }
}
