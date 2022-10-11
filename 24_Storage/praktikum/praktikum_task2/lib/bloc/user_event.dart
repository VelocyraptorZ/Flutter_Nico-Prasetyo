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
class AddBool extends UserEvent {
  bool newUser;
  AddBool({
    required this.newUser,
  });
}

// ignore: must_be_immutable
class AddName extends UserEvent {
  String username;
  AddName({
    required this.username,
  });
}

// ignore: must_be_immutable
class AddEmail extends UserEvent {
  String email;
  AddEmail({
    required this.email,
  });
}

// ignore: must_be_immutable
class AddNumber extends UserEvent {
  String number;
  AddNumber({
    required this.number,
  });
}

class RemoveName extends UserEvent {}

class RemoveEmail extends UserEvent {}

class RemoveNumber extends UserEvent {}

class ChangeUser extends UserEvent {}
