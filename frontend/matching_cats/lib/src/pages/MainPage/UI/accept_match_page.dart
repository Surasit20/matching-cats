import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/cats_bloc/cats_bloc.dart';
import 'package:matching_cats/src/blocs/dash_board_bloc/dash_board_bloc.dart';
import 'package:matching_cats/src/models/cast_model.dart';

class AcceptMatchPage extends StatefulWidget {
  const AcceptMatchPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final id;
  @override
  State<AcceptMatchPage> createState() => _AcceptMatchPageState();
}

class _AcceptMatchPageState extends State<AcceptMatchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    print(arg);
    BlocProvider.of<CatsBloc>(context).add(OnGetCat(id: arg["id"]));
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CatsBloc, CatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetCatSuccessState) {
            print(state.cat[0]["pending"].toString());
            return buildListView(context, state.cat);
          } else {
            return Container();
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
            const Text(
              "History",
              style: TextStyle(fontSize: 50.00),
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
            ),
          ],
        ),
      );

  Widget buildListView(BuildContext context, dynamic _names) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (cat, i) {
          String name = _names[0]["pending"][i].toString();
          // print("ggggggg");
          // print(name);

          return ListTile(
            leading: CircleAvatar(
              child: Text('${name}'),
            ),
            title: Text('$name'),
            // <Add>
            trailing: PopupMenuButton(
              icon: const Icon(
                Icons.heart_broken,
                color: Colors.green,
                size: 30.0,
              ),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 'Accept',
                    child: Text('Accept'),
                  ),
                  const PopupMenuItem(
                    value: 'Cancel',
                    child: Text('Cancel'),
                  )
                ];
              },
              onSelected: (String value) {
                print('You Click on po up menu item $value ');
              },
            ),
            onTap: () => {},
            // </Add>
          );
        },
        itemCount: _names[0]["pending"].length,
      ),
    );
  }
}
