part of 'professor_functionalities_content_cubit.dart';

@immutable
abstract class ProfessorFunctionalitiesContentState {}

class ProfessorFunctionalitiesContentInitial extends ProfessorFunctionalitiesContentState {}
class ProfessorFunctionalitiesContentLoaded extends ProfessorFunctionalitiesContentState {
  
  final String content;
  ProfessorFunctionalitiesContentLoaded({
    required this.content,
  });
}
class ProfessorFunctionalitiesContentLoading extends ProfessorFunctionalitiesContentState {}
class ProfessorFunctionalitiesContentError extends ProfessorFunctionalitiesContentState {}
