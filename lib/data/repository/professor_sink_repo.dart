import 'package:testing_project/data/local_db/professor_sink.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/excersize.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/models/student.dart';

class ProfessorSinkRepo {
  final ProfessorSink _professorSink = ProfessorSink();
  Future<List<Professor>> getProfessor(String userName, String password) async {
    List<Map<String, Object?>> rawProfessors =
        await _professorSink.getProfessor(userName, password);
    List<Professor> professors = [];
    for (var professor in rawProfessors) {
      professors.add(Professor(
          id: professor['prof_id'] as int,
          name: professor['name'] as String,
          userName: professor['user_name'] as String,
          password: professor['password'] as String));
    }
    return professors;
  }

  Future<List<Course>> getProfessorCourses(Professor professor) async {
    List<Map<String, Object?>> rawCourses =
        await _professorSink.getCoursesOfProfessor(professor);
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

  Future<String> getCourseContent(Professor professor, Course course) async {
    List<Map<String, Object?>> listOfContents =
        await _professorSink.getCourseContent(professor, course);

    //todo => is this hard coding efficient a good practice?
    return listOfContents[0]['content'] as String;
  }

  Future<List<Excersize>> getCourseExcersizes(Course course) async {
    List<Map<String, Object?>> rawExcersizes =
        await _professorSink.getCourseExcersizes(course);
    List<Excersize> excersizes = [];
    rawExcersizes.forEach((excersize) {
      excersizes.add(Excersize(
          id: excersize['ex_id'] as int,
          question: excersize['question'] as String,
          answer: excersize['answer'] as int,
          courseId: excersize['course_id'] as int));
    });

    return excersizes;
  }
}
