import 'package:flutter_test/flutter_test.dart';
import 'package:testing_project/data/models/enrollment.dart';
import 'package:testing_project/data/models/student.dart';
import 'package:testing_project/data/zoft/student_sink.dart';

void main() {
  //unit testing for studentSink class
  final StudentSink studentSink = StudentSink();

  test("test getStudent function", () async {
    expect(
        await studentSink.getStudent('amr', 'amor'),
        await Future.delayed((const Duration(seconds: 0)), () {
          return [
            {
              "student_id": 0,
              'name': 'amr',
              'user_name': 'amr',
              'password': "amor"
            },
          ];
        }));

    expect(studentSink.getStudent('faliure', 'faliure'), null);
    expect(studentSink.getStudent('', ''), null);
  });
  test("test getStudentEnrollments function", () async {
    expect(
        await studentSink.getStudentEnrollments(
            Student(id: 0, name: 'amr', userName: 'amr', password: 'amor')),
        await Future.delayed((const Duration(seconds: 0)), () {
          return [
            {"quiz_grade": 2, 'student_id': 0, 'course_id': 0},
            {"quiz_grade": 2, 'student_id': 0, 'course_id': 0},
            {"quiz_grade": 2, 'student_id': 0, 'course_id': 0},
          ];
        }));

    expect(
        studentSink.getStudentEnrollments(
            Student(id: 44444, name: '', userName: '', password: '')),
        null);
    expect(
        studentSink.getStudentEnrollments(Student(
            id: 00000000,
            name: 'faliure',
            userName: 'faliure',
            password: 'faliure')),
        null);
  });
  test("test getStudentCoursesFromEnrollments function", () async {
    expect(
        await studentSink.getStudentCoursesFromEnrollments([
          Enrollment(quizGrade: 2, studentId: 0, courseId: 0),
          Enrollment(quizGrade: 7, studentId: 0, courseId: 0),
          Enrollment(quizGrade: 0, studentId: 0, courseId: 0),
          Enrollment(quizGrade: 10, studentId: 0, courseId: 0)
        ]),
        await Future.delayed((const Duration(seconds: 0)), () {
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
        }));
    expect(studentSink.getStudentCoursesFromEnrollments([]), null);
    expect(
        studentSink.getStudentCoursesFromEnrollments([
          Enrollment(quizGrade: -11, studentId: 777, courseId: 0),
          Enrollment(quizGrade: 700, studentId: 585, courseId: 0),
        ]),
        null);
  });
}
