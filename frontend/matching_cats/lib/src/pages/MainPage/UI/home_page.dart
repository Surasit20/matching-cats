import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/dash_board_bloc/dash_board_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key, required this.title, required this.username})
      : super(key: key);

  final String title;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocConsumer<DashBoardBloc, DashBoardState>(
        listener: (context, state) {
          if (state is DashboardNav) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is DashboardLoading) {
            return LoadingWidget(
              child: initialLayout(context),
            );
          } else {
            return initialLayout(context);
          }
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
              "hai $username!",
              style: const TextStyle(fontSize: 50.00),
            ),
          ],
        ),
      );
}
