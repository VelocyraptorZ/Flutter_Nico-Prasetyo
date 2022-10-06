part of 'contact_bloc.dart';

@immutable
abstract class ContactState {
  const ContactState();

  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

// ignore: must_be_immutable
class ContactLoaded extends ContactState {
  List items = [];
  ContactLoaded({required this.items});
}
