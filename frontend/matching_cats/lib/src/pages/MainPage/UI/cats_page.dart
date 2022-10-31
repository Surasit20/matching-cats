import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/dash_board_bloc/dash_board_bloc.dart';

class CatsPage extends StatelessWidget {
  const CatsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<DashBoardBloc, DashBoardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return initialLayout(context);
        },
      ),
    );
  }

  Widget initialLayout(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "hai test!",
              style: const TextStyle(fontSize: 50.00),
            ),

            // ปุ่มแอดแมว
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/add/cat',
                );
              },
              child: Text('Add Cat Button'),
            )
          ],
        ),
      );
}
