part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class CheckRegister extends UserEvent {
  BuildContext? context;
  CheckRegister({
    this.context,
  });
}

class Initial extends UserEvent {}

// ignore: must_be_immutable
class AddRegister extends UserEvent {
  bool newUser;
  String username;
  String email;
  String number;
  AddRegister({
    required this.newUser,
    required this.username,
    required this.email,
    required this.number,
  });
}

class RemoveRegister extends UserEvent {}

class ChangeUser extends UserEvent {}
