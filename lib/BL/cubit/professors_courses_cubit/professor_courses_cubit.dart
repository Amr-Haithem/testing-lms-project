import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/repository/professor_sink_repo.dart';

import '../../../../data/models/course.dart';
import '../../../data/local_db/professor_sink.dart';


part 'professor_courses_state.dart';

class ProfessorCoursesCubit
    extends Cubit<ProfessorCoursesState> {
  ProfessorCoursesCubit() : super(ProfessorCoursesLoading());
  final ProfessorSinkRepo _professorSinkRepo = ProfessorSinkRepo(professorSink: ProfessorSink());
  
  void getProfessorCourses(Professor professor) {
    emit(ProfessorCoursesLoading());
    _professorSinkRepo.getProfessorCourses(professor).then((courses) {
      emit(ProfessorCoursesLoaded(courses: courses));
    }).onError((error, stackTrace) {
      emit(ProfessorCoursesError());
    });
  }
}
