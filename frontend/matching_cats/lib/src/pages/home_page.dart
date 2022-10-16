/*
import 'dart:developer';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:matching_cats/src/blocs/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/bloc/test_bloc.dart';

import '../blocs/bloc/auth_event.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TestBloc testBloc;
  int _counter = 0;

  void _incrementCounter() {
    print("Start");
    BlocProvider.of<TestBloc>(context)
        .add(Register(email: 'sdfgdfg', password: 'dfgdfg'));
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("test"),
        leading: IconButton(
          icon: Icon(Icons.ac_unit_sharp),
          onPressed: () {
            _incrementCounter();
          },
        ),
      ),
      body: BlocConsumer<TestBloc, TestState>(
        listener: (context, state) {
          if (state is AuthError) {
          } else if (state is AuthLoaded) {
            Navigator.of(context)
                .pushNamed('/dashboard', arguments: state.username);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Container(
              child: Text("กดเกดเ"),
            );
          } else {
            return Container(
              child: Text("กดเกดเ"),
            );
          }
        },
      ),
    );
  }
}
*/
