part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class UserChanged extends UserState {
  String username;
  String email;
  String number;
  UserChanged({
    this.username = '',
    this.email = '',
    this.number = '',
  });

  @override
  List<Object> get props => [username, email, number];
}
