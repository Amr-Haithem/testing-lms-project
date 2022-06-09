import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_project/data/local_db/professor_sink.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/excersize.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/repository/professor_sink_repo.dart';

class MockProfessorSink extends Mock implements ProfessorSink {
  @override
  Future<List<Map<String, Object?>>> getCourseContent(
      Professor professor, Course course) {
    return Future.delayed(Duration(seconds: 0), () {
      return [
        {"content": "mocked content"}
      ];
    });
  }

  @override
  Future<List<Map<String, Object?>>> getCourseExcersizes(Course course) {
    return Future.delayed(Duration(seconds: 0), () {
      return [
        {"question": "someQuestion", "answer": 0, "ex_id": 28, "course_id": 1}
      ];
    });
  }

  @override
  Future<List<Map<String, Object?>>> getProfessor(
      String userName, String password) {
    return Future.delayed(Duration(seconds: 0), () {
      return [
        {
          "prof_id": 0,
          "name": "amr",
          "user_name": "el ot",
          "password": "meowmeow"
        }
      ];
    });
  }

  @override
  Future<List<Map<String, Object?>>> getCoursesOfProfessor(
      Professor professor) {
    return Future.delayed(Duration(seconds: 0), () {
      return [
        {
          "course_id": 0,
          "name": "courseto",
          "content": "contenteto",
          "prof_id": 3
        },
        {"course_id": 1, "name": "el 7ob", "content": "ortoo", "prof_id": 3}
      ];
    });
  }
}

void main() {
  ProfessorSinkRepo professorSinkRepo =
      ProfessorSinkRepo(professorSink: MockProfessorSink());

  setUp(() {});
  tearDown(() {});


  
  test("getting courses content", () async {
    Professor professor =
        Professor(id: 0, name: "shehab", userName: "shehab", password: "sheba");
    Course course =
        Course(id: 0, name: "vibration an waves", content: "NA", profId: 0);

    expect(await professorSinkRepo.getCourseContent(professor, course), "meow");
  });




  test("getting excersizes for a certain course", () async {
    Course course =
        Course(id: 0, name: "desgin", content: "content", profId: 0);

    expect(await professorSinkRepo.getCourseExcersizes(course),
        [Excersize(id: 28, question: "someQuestion", answer: 0, courseId: 1)]);
  });



  
  test("getting professor", () async {
    expect(await professorSinkRepo.getProfessor('amr', 'meowmeow'), [
      Professor(id: 0, name: "amr", userName: "el ot", password: "meowmeow")
    ]);
  });

  test("getting professor courses", () async {
    Professor professor =
        Professor(id: 0, name: "saeed", userName: "man", password: "password");

    expect(await professorSinkRepo.getProfessorCourses(professor), [
      Course(id: 0, name: "courseto", content: "contenteto", profId: 3),
      Course(id: 1, name: "el 7ob", content: "ortoo", profId: 3)
    ]);
  });
}
