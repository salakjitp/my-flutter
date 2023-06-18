part of 'login_bloc.dart';

class LoginState extends Equatable {
  final int count;
  final bool isAuthenticated;
  final bool isLoginSubmit;

  const LoginState(
      {this.count = 0,
      this.isAuthenticated = false,
      this.isLoginSubmit = false});

  LoginState copyWith(
      {int? count, bool? isAuthenticated, bool? isLoginSubmit}) {
    return LoginState(
        count: count ?? this.count,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        isLoginSubmit: isLoginSubmit ?? this.isLoginSubmit);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count, isAuthenticated, isLoginSubmit];
}
