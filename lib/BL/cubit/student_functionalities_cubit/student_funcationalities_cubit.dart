import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_project/data/repository/student_sink_repo.dart';

import '../../../data/local_db/student_sink.dart';
import '../../../data/models/course.dart';
import '../../../data/models/student.dart';

part 'student_funcationalities_state.dart';

class StudentFuncationalitiesCubit extends Cubit<StudentFuncationalitiesState> {
  StudentFuncationalitiesCubit() : super(StudentFuncationalitiesInitial());
  final StudentSinkRepo _studentSinkRepo = StudentSinkRepo(studentSink: StudentSink());
  void registerCoursesForAStudent(Student student, List<Course> courses) async {
    emit(StudentFuncationalitiesRegisteringCoursesLoading());
    await _studentSinkRepo
        .registerCoursesForAStudent(student, courses)
        .then((value) {
      emit(StudentFuncationalitiesRegisteringCoursesLoaded());
      
    }).onError((error, stackTrace) {
      emit(StudentFuncationalitiesRegisteringCoursesError());
    });
  }
}
