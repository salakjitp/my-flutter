part of 'login_bloc.dart';

class LoginState extends Equatable {
  final int count;
  final bool isAuthenticated;

  const LoginState({this.count = 0, this.isAuthenticated = false});

  LoginState copyWith({int? count, bool? isAuthenticated}) {
    return LoginState(
        count: count ?? this.count,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count, isAuthenticated];
}
