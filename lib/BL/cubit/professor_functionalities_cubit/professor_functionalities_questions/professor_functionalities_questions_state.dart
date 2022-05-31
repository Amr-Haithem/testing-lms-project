part of 'professor_functionalities_questions_cubit.dart';

@immutable
abstract class ProfessorFunctionalitiesQuestionsState {}

class ProfessorFunctionalitiesQuestionsInitial extends ProfessorFunctionalitiesQuestionsState {}
class ProfessorFunctionalitiesQuestionsLoaded extends ProfessorFunctionalitiesQuestionsState {
   final List<Excersize> excersizes;
  ProfessorFunctionalitiesQuestionsLoaded({
    required this.excersizes,
  });
}
class ProfessorFunctionalitiesQuestionsLoading extends ProfessorFunctionalitiesQuestionsState {}
class ProfessorFunctionalitiesQuestionsError extends ProfessorFunctionalitiesQuestionsState {}
