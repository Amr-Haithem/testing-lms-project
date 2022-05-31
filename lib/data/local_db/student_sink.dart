import 'package:sqflite/sqflite.dart';
import 'package:testing_project/data/local_db/lms_db.dart';
import 'package:testing_project/data/models/enrollment.dart';

import '../models/course.dart';
import '../models/student.dart';

class StudentSink {
  final LmsDB _lmsDB = LmsDB();
  Future<List<Map<String, Object?>>> getStudent(
      String userName, String password) async {
    Database db = await _lmsDB.database;
    return await db.query('Student',
        where: '''user_name= '$userName' AND password = '$password' ''');
  }

  Future<List<Map<String, Object?>>> getStudentEnrollments(
      Student student) async {
    Database db = await _lmsDB.database;
    return await db.query('enrolled_student_course',
        where: ''' student_id=${student.id} ''');
  }

  String _queryEnrollmentsGetterForGetStudentCourses(
      List<Enrollment> enrollments) {
    //todo is this a good practice?
    String query = 'false';
    for (var i = 0; i < enrollments.length; i++) {
      if (i == 0) {
        query = '''course_id=${enrollments[0].courseId} ''';
      } else {
        query += '''OR course_id=${enrollments[i].courseId} ''';
      }
    }
    return query;
  }

  Future<List<Map<String, Object?>>> getStudentCoursesFromEnrollments(
      List<Enrollment> enrollments) async {
    Database db = await _lmsDB.database;
    return await db.query('Course',
        where: _queryEnrollmentsGetterForGetStudentCourses(enrollments));
  }

  Future<List<Map<String, Object?>>> getAllCourses() async { 
    Database db = await _lmsDB.database;
    return await db.query('Course');
  
  }

  Future<void> registerCoursesForAStudent(
      Student student, List<Course> courses) async {
    Database db = await _lmsDB.database;
    for (var course in courses) {
      await db.insert('enrolled_student_course',
          {'quiz_grade': -1, 'student_id': student.id, 'course_id': course.id});
    }
  }
}
