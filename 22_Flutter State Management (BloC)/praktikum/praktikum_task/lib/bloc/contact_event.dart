// ignore_for_file: must_be_immutable
part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {
  const ContactEvent();

  List<Object> get props => [];
}

class InitializeContactEvent extends ContactEvent {}

// ignore: camel_case_types
class addContact extends ContactEvent {
  ContactModel contactModel;

  addContact({required this.contactModel});
}

// ignore: camel_case_types
class deleteContact extends ContactEvent {
  ContactModel contactModel;

  deleteContact({required this.contactModel});
}
