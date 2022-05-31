part of 'student_courses_cubit.dart';

@immutable
abstract class StudentCoursesState {}

class StudentCoursesInitial extends StudentCoursesState {}

class StudentCoursesError extends StudentCoursesState {}

class StudentCoursesLoading extends StudentCoursesState {}


class StudentCoursesLoaded extends StudentCoursesState {
  final List<Course> courses;
  StudentCoursesLoaded({
    required this.courses,
  });
}


class StudentCoursesToChooseError extends StudentCoursesState {}

class StudentCoursesToChooseLoading extends StudentCoursesState {}

class StudentCoursesToChooseLoaded extends StudentCoursesState {
  final List<Course> courses;
  StudentCoursesToChooseLoaded({
    required this.courses,
  });
}
