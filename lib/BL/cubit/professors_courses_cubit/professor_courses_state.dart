part of 'professor_courses_cubit.dart';

@immutable
abstract class ProfessorCoursesState {}

class ProfessorCoursesLoading extends ProfessorCoursesState {}

class ProfessorCoursesLoaded extends ProfessorCoursesState {
  final List<Course> courses;
  ProfessorCoursesLoaded({
    required this.courses,
  });
}

class ProfessorCoursesError extends ProfessorCoursesState {}
