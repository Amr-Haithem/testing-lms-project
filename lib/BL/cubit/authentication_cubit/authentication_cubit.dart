import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_project/data/local_db/student_sink.dart';
import 'package:testing_project/data/repository/professor_sink_repo.dart';
import 'package:testing_project/data/repository/student_sink_repo.dart';

import '../../../data/local_db/professor_sink.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  final StudentSinkRepo _studentSinkRepo = StudentSinkRepo(studentSink: StudentSink());
  final ProfessorSinkRepo _professorSinkRepo = ProfessorSinkRepo(professorSink: ProfessorSink());
  
  void authenticateUser(String userName, String password) {
    emit(AuthenticationLoading());
    _studentSinkRepo.getStudents(userName, password).then((value) {
      if (value.isEmpty) {
        _professorSinkRepo.getProfessor(userName, password).then((value) {
          if (value.isEmpty) {
            emit(AuthenticationLoadingError(message: "user not found"));
          } else {
            emit(AuthenticationLoaded(
                student: false, studentOrProfessor: value[0]));
          }
        }).onError((error, stackTrace) {
          emit(AuthenticationLoadingError(
              message: "error while authenticating"));
        });
      } else {
        emit(AuthenticationLoaded(student: true, studentOrProfessor: value[0]));
      }
    }).onError((error, stackTrace) {
      emit(AuthenticationLoadingError(message: "error while authenticating"));
    });
  }
}
