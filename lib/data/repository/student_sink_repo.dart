import 'package:testing_project/data/local_db/student_sink.dart';
import 'package:testing_project/data/models/student.dart';

class StudentSinkRepo {
  final StudentSink _studentSink = StudentSink();
  Future<List<Student>> getStudents(String userName, String password) async {
    List<Map<String, Object?>> rawStudents =
        await _studentSink.getStudent(userName, password);
    List<Student> students = [];
    for (var student in rawStudents) {
      students.add(Student(
          id: student["student_id"] as int,
          name: student["name"] as String,
          userName: student["user_name"] as String,
          password: student["password"] as String));
    }

    return students;
  }
}
