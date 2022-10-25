import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/auth_bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _userNameInput, _passwordInput, _emailInput;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            buildErrorLayout();
          } else if (state is RegisterLoadingState) {
            clearTextData();
            Navigator.of(context).pushNamed(
              '/dashboard',
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return Container(
              child: Text("test"),
            );
          } else if (state is AuthInitial) {
            return buildInitialInput();
          } else {
            return Container(
              child: Text("test"),
            );
          }
        },
      ),
    );
  }

  Widget buildInitialInput() => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Login"),

          //input email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your email',
              ),
            ),
          ),

          //input password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
              ),
            ),
          ),

          //summit button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue, width: 1),
                  minimumSize: const Size(double.infinity, 54),
                  backgroundColor: Colors.blue[50]),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(OnLogin(
                  email: _emailInput,
                  password: _passwordInput,
                ));
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ));

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );

  clearTextData() {}
}
