import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_cats/src/blocs/cats_bloc/cats_bloc.dart';

class AddCatPage extends StatefulWidget {
  const AddCatPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<AddCatPage> createState() => _AddCatPageState();
}

class _AddCatPageState extends State<AddCatPage> {
  String _nameInput = "",
      _ownerInput = "",
      _breedInput = "",
      _colorInput = "",
      _ageInput = "",
      _sexInput = "",
      _vaccineInput = "",
      _congenitalDiseaseInput = "",
      _natureOfParentingInput = "";
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
      body: BlocConsumer<CatsBloc, CatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildInitialInput();
        },
      ),
    );
  }

  Widget buildInitialInput() => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Add Cats"),

          //input name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _nameInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
          ),

          //input owner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _ownerInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your owner',
              ),
            ),
          ),

          //input breed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _breedInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your breed',
              ),
            ),
          ),

          //input color
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _colorInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your color',
              ),
            ),
          ),

          //input sex
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _sexInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your sex',
              ),
            ),
          ),

          //input age
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _ageInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your ahe',
              ),
            ),
          ),

          //input vaccine
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _vaccineInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your vaccine',
              ),
            ),
          ),

          //input congenitalDisease
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _congenitalDiseaseInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your congenitalDisease',
              ),
            ),
          ),

          //input  natureOfParenting
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => _natureOfParentingInput = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your  natureOfParenting',
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
                clearTextData();
                print("begin add cats_bloc");
                BlocProvider.of<CatsBloc>(context).add(OnAddCat(
                  name: _nameInput,
                  owner: _ownerInput,
                  breed: _breedInput,
                  color: _colorInput,
                  sex: _sexInput,
                  age: _ageInput,
                  vaccine: _vaccineInput,
                  congenitalDisease: _congenitalDiseaseInput,
                  natureOfParenting: _natureOfParentingInput,
                ));
              },
              child: const Text(
                'Add',
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
