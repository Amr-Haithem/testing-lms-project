part of 'student_funcationalities_cubit.dart';

@immutable
abstract class StudentFuncationalitiesState {}

class StudentFuncationalitiesInitial extends StudentFuncationalitiesState {}

class StudentFuncationalitiesRegisteringCoursesLoading
    extends StudentFuncationalitiesState {}

class StudentFuncationalitiesRegisteringCoursesLoaded
    extends StudentFuncationalitiesState {}

class StudentFuncationalitiesRegisteringCoursesError
    extends StudentFuncationalitiesState {}
