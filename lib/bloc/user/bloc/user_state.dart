part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  UserProfileModal? usersList;
  UserLoaded({this.usersList});
}

class UserError extends UserState {
  final String? error;
  const UserError({required this.error});
}
