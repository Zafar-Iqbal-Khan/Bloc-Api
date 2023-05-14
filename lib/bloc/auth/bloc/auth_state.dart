part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthErrorState extends AuthState {}

class LoginState extends AuthState {
  // final LoginResponse loginResponse;

  // const LoginState(this.loginResponse);
  // @override
  // List<Object?> get props => [loginResponse];
}
