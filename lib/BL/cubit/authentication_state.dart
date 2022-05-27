part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoaded extends AuthenticationState {}

class AuthenticationLoadingError extends AuthenticationState {
  final String message;

  AuthenticationLoadingError({required this.message});
}
