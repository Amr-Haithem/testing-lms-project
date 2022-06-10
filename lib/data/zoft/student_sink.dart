import 'package:testing_project/data/models/enrollment.dart';
import '../models/student.dart';

class StudentSink {
  Future<List<Map<String, Object?>>> getStudent(
      String userName, String password) async {
    return await Future.delayed((const Duration(seconds: 0)), () {
      return [
        {"name": 'amr', 'student_id': 0, 'user_name': 'amr', 'password': 'amor'}
      ];
    });
  }

  Future<List<Map<String, Object?>>> getStudentEnrollments(
      Student student) async {
    return await Future.delayed((const Duration(seconds: 0)), () {
      return [
        {"quiz_grade": 2, 'student_id': 0, 'course_id': 0},
        {"quiz_grade": 2, 'student_id': 0, 'course_id': 0},
        {"quiz_grade": 2, 'student_id': 0, 'course_id': 0},
      ];
    });
  }

  Future<List<Map<String, Object?>>> getStudentCoursesFromEnrollments(
      List<Enrollment> enrollments) async {
    return Future.delayed((const Duration(seconds: 0)), () {
      return [
        {
          'prof_id': 0,
          'course_id': 0,
          'content': 'no content yet',
          'name': "vibration and waves"
        },
        {
          'prof_id': 0,
          'course_id': 1,
          'content': 'no content yet',
          'name': "Logic design"
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

  Future<List<Map<String, Object?>>> getAllCourses() async {
    return Future.delayed((const Duration(seconds: 0)), () {
      return [
        {
          'prof_id': 0,
          'course_id': 0,
          'content': 'no content yet',
          'name': "vibration and waves"
        },
        {
          'prof_id': 0,
          'course_id': 1,
          'content': 'no content yet',
          'name': "Logic design"
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
        },
        {
          'prof_id': 1,
          'course_id': 3,
          'content': 'no content yet',
          'name': "programming"
        },
        {
          'prof_id': 1,
          'course_id': 4,
          'content': 'no content yet',
          'name': "Advanced programming"
        },
        {
          'prof_id': 1,
          'course_id': 5,
          'content': 'no content yet',
          'name': "Embedded systems"
        }
      ];
    });
  }
}
