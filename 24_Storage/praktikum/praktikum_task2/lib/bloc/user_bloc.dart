// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserRegister()) {
    late SharedPreferences registerdata;
    String username = '';
    String email = '';
    String number = '';

    on<Initial>(
      (event, emit) async {
        if (state is UserRegister) {
          registerdata = await SharedPreferences.getInstance();
          username = registerdata.getString('username').toString();
          email = registerdata.getString('email').toString();
          number = registerdata.getString('number').toString();
          emit(UserRegister(username: username, email: email, number: number));
        }
      },
    );

    on<AddRegister>(
      (event, emit) async {
        if (state is UserRegister) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.setBool('register', event.newUser);
          registerdata.setString('username', event.username);
          registerdata.setString('email', event.email);
          registerdata.setString('number', event.number);
        }
      },
    );

    on<RemoveRegister>(
      (event, emit) async {
        if (state is UserRegister) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.remove('username');
          registerdata.remove('email');
          registerdata.remove('number');
        }
      },
    );
  }
}
