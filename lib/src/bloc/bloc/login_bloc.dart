import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
      emit(state.copyWith(isAuthenticated: true));
    });
  }
}