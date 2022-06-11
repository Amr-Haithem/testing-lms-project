import 'package:sqflite/sqflite.dart';
import 'package:testing_project/data/local_db/lms_db.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/professor.dart';

class ProfessorSink {
  final LmsDB _lmsDB = LmsDB();
  Future<List<Map<String, Object?>>> getProfessor(
      String userName, String password) async {
    Database db = await _lmsDB.database;
    return await db.query('professor',
        where: '''user_name= '$userName' AND password = '$password' ''');
  }


  Future<List<Map<String, Object?>>> getCoursesOfProfessor(
      Professor professor) async {
        
    Database db = await _lmsDB.database;
    return await db
        .query("Course", where: ''' prof_id = ${professor.id.toString()}''');
  }

  Future<List<Map<String, Object?>>> getCourseContent(
      Professor professor, Course course) async {
    Database db = await _lmsDB.database;
    return await db.query("Course",
        columns: ['content'],
        where:
            ''' prof_id = ${professor.id.toString()} AND course_id =${course.id.toString()}''');
  }

  Future<List<Map<String, Object?>>> getCourseExcersizes(
      Course course) async {
    Database db = await _lmsDB.database;
    return await db.query("Excersize",
        where:
            ''' course_id =${course.id.toString()}''');
  }
}
