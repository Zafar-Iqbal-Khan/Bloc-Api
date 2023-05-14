import 'package:api_bloc/model/user_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../resource/api_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    try {
      on<GetUserList>((event, emit) async {
        emit(UserInitial());
        final UserProfileModal usersList = await apiRepository.fetchUsersList();
        emit(UserLoaded(usersList: usersList));
        if (usersList.error != null) {
          emit(UserError(error: usersList.error));
        }
      });
    } on NetworkError {
      emit(
        const UserError(error: "Failed to fetch data is your device online"),
      );
    }
  }
}
