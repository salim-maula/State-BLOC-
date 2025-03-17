part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddUserEvent extends UserEvent {
  AddUserEvent(this.user);
  
  final User user;
}

class EditUserEvent extends UserEvent {
  EditUserEvent(this.user);
  
  final User user;
}

class DeleteUserEvent extends UserEvent {
  DeleteUserEvent(this.user);
  
  final User user;
}