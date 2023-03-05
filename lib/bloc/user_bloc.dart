import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/bloc/user_event.dart';
import 'package:user_list/bloc/user_state.dart';

import '../models/user.dart';
import '../services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmplyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> _loadedUserList = await usersRepository.gerAllUsers();
        emit(UserLoadedState(loadedUser: _loadedUserList));
      } catch (_) {
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>((event, emit) async {
      emit(UserEmplyState());
    });
  }
}
