import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_project/data/repository/professor_sink_repo.dart';

import '../../../../data/models/course.dart';
import '../../../../data/models/excersize.dart';

part 'professor_functionalities_questions_state.dart';

class ProfessorFunctionalitiesQuestionsCubit
    extends Cubit<ProfessorFunctionalitiesQuestionsState> {
  ProfessorFunctionalitiesQuestionsCubit()
      : super(ProfessorFunctionalitiesQuestionsInitial());
  final ProfessorSinkRepo _professorSinkRepo = ProfessorSinkRepo();
  void getCourseExcersizes(Course course) {
    emit(ProfessorFunctionalitiesQuestionsLoading());
    _professorSinkRepo.getCourseExcersizes(course).then((excersizes) {
      emit(ProfessorFunctionalitiesQuestionsLoaded(excersizes: excersizes));
    }).onError((error, stackTrace) {
      emit(ProfessorFunctionalitiesQuestionsError());
    });
  }
}
