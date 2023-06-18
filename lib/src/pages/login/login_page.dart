import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/bloc/bloc/login_bloc.dart';
import 'package:flutter_application_1/src/pages/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = "admin";
    _passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the LoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("Login Page ${state.count}");
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber.withOpacity(0.2),
        child: Padding(
            padding: const EdgeInsets.all(32),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(32),
                // height: double.infinity,
                // height: 300,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._builTextFileds(),
                      const SizedBox(height: 32),
                      ..._buildButtons(),
                      Row(
                        children: [
                          // Text("Count: ${context.read<LoginBloc>().state.count}"),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Text("Count: ${state.count}");
                            },
                          ),
                          IconButton(
                              onPressed: _handleClickAdd,
                              icon: const Icon(Icons.add)),
                          IconButton(
                              onPressed: _handleClickMinus,
                              icon: const Icon(Icons.remove))
                        ],
                      )
                    ]),
              ),
            )),
      ),
    );
  }

  void _handleClickLogin() {
    // print("Login ${_usernameController.text}");
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  _buildButtons() {
    return [
      ElevatedButton(onPressed: _handleClickLogin, child: const Text("Login")),
      const SizedBox(height: 10),
      OutlinedButton(
          onPressed: _handleClickRegister, child: const Text("Register")),
      const SizedBox(height: 10),
      OutlinedButton(onPressed: _handleClickReset, child: const Text("Reset"))
    ];
  }

  _builTextFileds() {
    return [
      TextField(
          controller: _usernameController,
          decoration: const InputDecoration(labelText: "Username")),
      const SizedBox(height: 10),
      TextField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: "Password")),
    ];
  }

  void _handleClickAdd() {
    context.read<LoginBloc>().add(LoginEventAdd());
  }

  void _handleClickMinus() {
    context.read<LoginBloc>().add(LoginEventMinus());
  }
}
