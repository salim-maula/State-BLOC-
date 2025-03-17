import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_bloc/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial([])) {
    //! Add User
    on<AddUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUsers));
        state.allUsers.add(event.user);
        emit(UserFinish(state.allUsers));
      } catch (e) {
        emit(UserError(state.allUsers));
      }
    });

    //! Edit User
    on<EditUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUsers));
        User selectUser = state.allUsers.where((element) => element.id == event.user.id).first;
        selectUser.name = event.user.name;
        selectUser.age = event.user.age;
        // state.allUsers.add(event.user);
        emit(UserFinish(state.allUsers));
      } catch (e) {
        emit(UserError(state.allUsers));
      }
    });

    //! Delete User
    on<DeleteUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUsers));
        state.allUsers.removeWhere((element) => element == event.user);
        emit(UserFinish(state.allUsers));
      } catch (e) {
        emit(UserError(state.allUsers));
      }
    });
  }
}
