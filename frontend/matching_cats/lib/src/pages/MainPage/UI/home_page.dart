import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/cats_bloc/cats_bloc.dart';
import 'package:matching_cats/src/blocs/dash_board_bloc/dash_board_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();

    BlocProvider.of<CatsBloc>(context).add(OnGetOwnerCat());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<DashBoardBloc, DashBoardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _initialLayout(context, state);
        },
      ),
    );
  }

  Widget _initialLayout(BuildContext context, DashBoardState state) => Center(
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
              child: Text('Add Cat Button1'),
            ),
            _popUpSelectCat()
          ],
        ),
      );

  Widget _popUpSelectCat() =>
      BlocConsumer<CatsBloc, CatsState>(listener: (context, state) {
        // do stuff here based on BlocA's state
      }, builder: (context, state) {
        if (state is GetOwnerCatSuccessState) {
          //PopupList(state.cats);
          final cats = state.cats;
          return PopupMenuButton(
            itemBuilder: (context) {
              var list = <PopupMenuEntry<Object>>[];
              for (var cat in cats) {
                final index = cats.indexOf(cat);

                list.add(
                  CheckedPopupMenuItem(
                    child: Text(
                      cat["name"].toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    value: index,
                    // checked: true,
                  ),
                );
              }
              return list;
            },
            onCanceled: () {
              print("You have canceled the menu.");
            },
            onSelected: (value) {
              print("value:$value");
            },
            icon: const Icon(
              Icons.add,
              size: 50,
              color: Colors.blue,
            ),
          );
        } else {
          return Container();
        }
      });

  Widget PopupList(dynamic catsList) => (PopupMenuButton(
        itemBuilder: (context) {
          print(catsList);
          var list = <PopupMenuEntry<Object>>[];
          print(catsList);
          list.add(
            CheckedPopupMenuItem(
              child: Text(
                "English",
                style: TextStyle(color: Colors.black),
              ),
              value: 1,
              // checked: true,
            ),
          );

          list.add(
            CheckedPopupMenuItem(
              child: Text(
                "English",
                style: TextStyle(color: Colors.black),
              ),
              value: 2,
              //checked: true,
            ),
          );

          return list;
        },
        initialValue: 2,
        onCanceled: () {
          print("You have canceled the menu.");
        },
        onSelected: (value) {
          print("value:$value");
        },
        icon: const Icon(
          Icons.add,
          size: 50,
          color: Colors.blue,
        ),
      ));
}
