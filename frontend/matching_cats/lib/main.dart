import 'package:flutter/material.dart';
import 'package:matching_cats/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:matching_cats/src/blocs/cats_bloc/cats_bloc.dart';
import 'package:matching_cats/src/blocs/dash_board_bloc/dash_board_bloc.dart';
import 'package:matching_cats/src/pages/AuthPage/UI/register_page.dart';
import 'package:matching_cats/src/pages/CatsPage/UI/add_cat_page.dart';
import 'package:matching_cats/src/pages/MainPage/UI/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/pages/launcher.dart';
import 'src/pages/AuthPage/UI/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => DashBoardBloc()),
        BlocProvider(create: (context) => CatsBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/launcher",
        routes: {
          "/register": (context) => const RegisterPage(
                title: 'register',
              ),
          "/home_page": (context) => const HomePage(
                title: 'home',
              ),
          "/login": (context) => const LoginPage(
                title: 'login',
              ),
          "/add/cat": (context) => const AddCatPage(
                title: 'add_cat_page',
              ),
          "/launcher": (context) => const LauncherPage(),
        },
      ),
    );
  }
}
