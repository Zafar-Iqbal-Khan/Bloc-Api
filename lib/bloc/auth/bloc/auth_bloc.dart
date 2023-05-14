import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resource/api_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiRepository apiRepository = ApiRepository();
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      emit(AuthLoadingState());
      if (event is LoginEvent) {
        await apiRepository
            .loginApi(username: event.username, password: event.password)
            .then((value) {
          if (value != null) {
            sharedPref.setString("TOKEN", value);
            emit(AuthLoadedState());
          } else {
            emit(AuthErrorState());
          }
        });
      }
    });
  }
}
