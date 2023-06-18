import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/bloc/login_bloc.dart';
import 'package:flutter_application_1/src/pages/login/login_page.dart';
import 'package:flutter_application_1/src/pages/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider(create: (context) => LoginBloc());

    return MultiBlocProvider(
        providers: [loginBloc],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(title: 'Login Page'),
          routes: AppRoute.all,
        ));
  }
}
