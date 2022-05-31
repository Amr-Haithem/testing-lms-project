part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoaded extends AuthenticationState {
  final bool student;
  final dynamic studentOrProfessor;
  AuthenticationLoaded({
    required this.student,
    required this.studentOrProfessor,
  });
}

class AuthenticationLoadingError extends AuthenticationState {
  final String message;

  AuthenticationLoadingError({required this.message});
}
