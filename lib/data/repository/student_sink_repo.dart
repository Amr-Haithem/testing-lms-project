import 'package:testing_project/data/local_db/student_sink.dart';
import 'package:testing_project/data/models/enrollment.dart';
import 'package:testing_project/data/models/student.dart';

import '../models/course.dart';

class StudentSinkRepo {
  final StudentSink _studentSink = StudentSink();
  Future<List<Student>> getStudents(String userName, String password) async {
    List<Map<String, Object?>> rawStudents =
        await _studentSink.getStudent(userName, password);
    List<Student> students = [];
    print(rawStudents);
    for (var student in rawStudents) {
      students.add(Student(
          id: student["student_id"] as int,
          name: student["name"] as String,
          userName: student["user_name"] as String,
          password: student["password"] as String));
    }

    return students;
  }

  Future<List<Course>> getStudentCourses(Student student) async {
    List<Map<String, Object?>> rawEnrollments =
        await _studentSink.getStudentEnrollments(student);
    List<Enrollment> enrollments = [];
    print(rawEnrollments);
    for (var enrollment in rawEnrollments) {
      enrollments.add(Enrollment(
          quizGrade: enrollment['quiz_grade'] as int,
          studentId: enrollment['student_id'] as int,
          courseId: enrollment['course_id'] as int));
    }
    print(enrollments);
    List<Map<String, Object?>> rawCourses =
        await _studentSink.getStudentCoursesFromEnrollments(enrollments);
    print("bababa");
    print(rawCourses);
    List<Course> courses = [];
    for (var course in rawCourses) {
      courses.add(Course(
          id: course['course_id'] as int,
          name: course['name'] as String,
          content: course['content'] as String,
          profId: course['prof_id'] as int));
    }
    return courses;
  }

  Future<List<Course>> getAllCourses() async {
    List<Map<String, Object?>> rawCourses = await _studentSink.getAllCourses();
    List<Course> courses = [];
    for (var course in rawCourses) {
      courses.add(Course(
          id: course['course_id'] as int,
          name: course['name'] as String,
          content: course['content'] as String,
          profId: course['prof_id'] as int));
    }
    return courses;
  }

  Future<void> registerCoursesForAStudent(
      Student student, List<Course> courses) async {
    await _studentSink.registerCoursesForAStudent(student, courses);
  }
}
