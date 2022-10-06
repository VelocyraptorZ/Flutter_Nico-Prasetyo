// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:praktikum_task/models/contact_model.dart';
part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<InitializeContactEvent>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      // ignore: prefer_const_literals_to_create_immutables
      emit(ContactLoaded(items: []));
    });

    on<addContact>((event, emit) {
      final state = this.state as ContactLoaded;
      final list = state.items;
      list.add(event.contactModel);
      emit(ContactLoaded(items: list));
    });

    on<deleteContact>((event, emit) {
      final state = this.state as ContactLoaded;
      final list = state.items;
      list.remove(event.contactModel);
      emit(ContactLoaded(items: list));
    });
  }
}
