part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  UserState(this.allUsers);

  List<User> allUsers;

  @override
  // TODO: implement props
  List<Object?> get props => [allUsers];
}

class UserInitial extends UserState {
  UserInitial(super.allUsers);
}


class UserLoading extends UserState {
  UserLoading(super.allUsers);
}

class UserFinish extends UserState {
  UserFinish(super.allUsers);
}

class UserError extends UserState {
  UserError(super.allUsers);
}
