import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_project/data/local_db/student_sink.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/enrollment.dart';
import 'package:testing_project/data/models/student.dart';
import 'package:testing_project/data/repository/student_sink_repo.dart';

class MockStudentSink extends Mock implements StudentSink {
  @override
  Future<List<Map<String, Object?>>> getAllCourses() {
    return Future.delayed(Duration(seconds: 0), () {
      return [
        {"course_id": 0, "name": "math", "content": "matheto", "prof_id": 58},
        {"course_id": 1, "name": "el dobb", "content": "dobbo", "prof_id": 588}
      ];
    });
  }

  @override
  Future<List<Map<String, Object?>>> getStudent(
      String userName, String password) {
    return Future.delayed(const Duration(seconds: 0), () {
      return [
        {
          "name": "amr haithem",
          "student_id": 78,
          "user_name": "amor el amor",
          "password": "pawwordooooo"
        },
      ];
    });
  }

  @override
  Future<List<Map<String, Object?>>> getStudentCoursesFromEnrollments(
      List<Enrollment> enrollments) {
    return Future.delayed(const Duration(seconds: 0), () {
      return [
        {
          "course_id": 70,
          "name": "bareto",
          "content": "anything yeah",
          "prof_id": 44984
        },
        {
          "course_id": 77,
          "name": "moreto",
          "content": "something",
          "prof_id": 282
        }
      ];
    });

    // Course(id: 0, name: "courseto", content: "contenteto", profId: 3),
    // Course(id: 1, name: "el 7ob", content: "ortoo", profId: 3)
  }
}

void main() {
  StudentSinkRepo studentSinkRepo =
      StudentSinkRepo(studentSink: MockStudentSink());

  test(("getting all available courses for a student"), () {
    expect(studentSinkRepo.getAllCourses(), [
      Course(id: 0, name: "math", content: "matheto", profId: 58),
      Course(id: 1, name: "el dobb", content: "dobbo", profId: 588)
    ]);
  });

  test(("getting a student object"), () {
    expect(
        studentSinkRepo.getStudents("amor el amor", "pawwordooooo"),
        [Student(
            id: 78,
            name: "amr haithem",
            userName: "amor el amor",
            password: "pawwordooooo")]);
  });

  test(("getting courses for one student"), () {
    expect(
        studentSinkRepo.getStudentCourses(Student(
            id: 0, name: "name", userName: "userName", password: "password")),
        [
          Course(
              id: 70, name: "bareto", content: "anything yeah", profId: 44984),
          Course(id: 77, name: "moreto", content: "something", profId: 282)
        ]);
  });
}
