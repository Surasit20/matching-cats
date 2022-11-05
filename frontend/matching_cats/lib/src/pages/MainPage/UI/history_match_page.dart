import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/cats_bloc/cats_bloc.dart';
import 'package:matching_cats/src/blocs/dash_board_bloc/dash_board_bloc.dart';
import 'package:matching_cats/src/models/cast_model.dart';

class HistoryMatchPage extends StatefulWidget {
  const HistoryMatchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryMatchPage> createState() => _HistoryMatchPageState();
}

class _HistoryMatchPageState extends State<HistoryMatchPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CatsBloc>(context).add(OnGetOwnerCat());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CatsBloc, CatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetOwnerCatSuccessState) {
            //print(state.catsAll);
            return buildListView(context, state.cats);
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
          String name = _names[i]["name"].toString();
          String id = _names[i]["_id"].toString();
          return ListTile(
            leading: CircleAvatar(
              child: Text('${name[0]}'),
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
                print('You Click on po up menu item $value $id ');
              },
            ),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed('/accept/match', arguments: {"id": id})
            },
            // </Add>
          );
        },
        itemCount: _names.length,
      ),
    );
  }
}
