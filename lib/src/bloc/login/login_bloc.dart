import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/pages/routes.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    //Add
    on<LoginEventAdd>((event, emit) async {
      // await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(count: state.count + 1));
    });

    //Minus
    on<LoginEventMinus>((event, emit) async {
      // await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(count: state.count - 1));
    });

    //Login
    on<LoginEventLogin>((event, emit) async {
      emit(state.copyWith(isLoginSubmit: true));

      if (event.payload.username == "admin" &&
          event.payload.passwoed == "1234") {
        emit(state.copyWith(isAuthenticated: true));
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(
            navigatorState.currentContext!,
            AppRoute.home,
          );
        }
      } else {
        emit(state.copyWith(isAuthenticated: false));
      }
    });
  }
}
