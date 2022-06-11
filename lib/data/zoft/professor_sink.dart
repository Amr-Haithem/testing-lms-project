import 'package:sqflite/sqflite.dart';
import 'package:testing_project/data/local_db/lms_db.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/professor.dart';

class ProfessorSink {
  final LmsDB _lmsDB = LmsDB();
  Future<List<Map<String, Object?>>> getProfessor(
      String userName, String password) async {
    return Future.delayed((Duration(seconds: 0)), () {
      return [
        {
          'user_name': 'shehab',
          'prof_id': 0,
          'password': 'sheba',
          'name': 'shehab'
        }
      ];
    });
  }

  Future<List<Map<String, Object?>>> getCoursesOfProfessor(
      Professor professor) async {
    return Future.delayed((Duration(seconds: 0)), () {
      return [
        {
          'prof_id': 0,
          'course_id': 0,
          'content': 'no content yet',
          'name': "vibration and waves"
        },
        {
          'prof_id': 0,
          'course_id': 2,
          'content': 'no content yet',
          'name': "Signals and systems"
        },
        {
          'prof_id': 0,
          'course_id': 6,
          'content': 'no content yet',
          'name': "Literature and love"
        }
      ];
    });
  }

  Future<String> getCourseContent(
      Professor professor, Course course) async {
    return Future.delayed((Duration(seconds: 0)), () {
      return "no content yet";
    });
  }

  Future<List<Map<String, Object?>>> getCourseExcersizes(Course course) async {
    return Future.delayed((Duration(seconds: 0)), () {
      return [
        {
          'course_id': 0,
          'ex_id': 0,
          'question': 'set a question',
          'answer': false
        },
        {
          'course_id': 0,
          'ex_id': 1,
          'question': 'set a question',
          'answer': false
        },
        {
          'course_id': 0,
          'ex_id': 2,
          'question': 'set a question',
          'answer': false
        }
      ];
    });
  }
}
