// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String? username, password;
  const LoginEvent({
    this.username,
    this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
