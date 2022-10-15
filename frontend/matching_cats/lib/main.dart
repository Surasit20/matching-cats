import 'package:flutter/material.dart';
import 'package:matching_cats/src/blocs/bloc/auth_bloc.dart';
import 'package:matching_cats/src/blocs/bloc/test_bloc.dart';
import 'package:matching_cats/src/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider(
          create: (context) => TestBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter'),
      ),
    );
  }
}
