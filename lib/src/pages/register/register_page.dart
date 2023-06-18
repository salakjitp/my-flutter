import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text('Register Page ${state.count}');
          },
        ),
      ),
      body: Container(),
    );
  }
}
