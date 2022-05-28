import 'package:testing_project/data/local_db/professor_sink.dart';
import 'package:testing_project/data/models/professor.dart';

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
}
