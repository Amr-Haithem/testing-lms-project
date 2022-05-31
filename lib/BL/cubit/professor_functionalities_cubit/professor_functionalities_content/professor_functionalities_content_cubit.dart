import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_project/data/local_db/professor_sink.dart';
import 'package:testing_project/data/repository/professor_sink_repo.dart';

import '../../../../data/models/course.dart';
import '../../../../data/models/professor.dart';

part 'professor_functionalities_content_state.dart';

class ProfessorFunctionalitiesContentCubit
    extends Cubit<ProfessorFunctionalitiesContentState> {
  ProfessorFunctionalitiesContentCubit()
      : super(ProfessorFunctionalitiesContentInitial());
  final ProfessorSinkRepo _professorSinkRepo = ProfessorSinkRepo(professorSink: ProfessorSink());

  void getCourseContent(Professor professor, Course course) async {
    emit(ProfessorFunctionalitiesContentLoading());
    await _professorSinkRepo
        .getCourseContent(professor, course)
        .then((content) {
      emit(ProfessorFunctionalitiesContentLoaded(content: content));
    }).onError((error, stackTrace) {
      emit(ProfessorFunctionalitiesContentError());
    });
  }
}
