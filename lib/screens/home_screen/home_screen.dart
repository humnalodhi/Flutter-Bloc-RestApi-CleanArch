import 'package:bloc_rest_api_clean_arch/model/person_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PersonModel> personList = [
    PersonModel(
      name: 'Aleeza',
    ),
    PersonModel(name: 'John'),
    PersonModel(name: 'Humna'),
  ];

  @override
  void initState() {
    var data = [
      {
        'name': 'Humna Lodhi',
      },
      {
        'name': null,
      },
      {
        'name': 'John Wick',
      }
    ];

    for (int i = 0; i < data.length; i++) {
      personList.add(
        PersonModel.fromJson(
          data[i],
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: personList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(personList[index].name ?? ''),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PersonModel personModel1 = PersonModel(name: 'Humna');
          PersonModel personModel2 = PersonModel(name: 'Humna');

          print(personModel1 == personModel2);
          print(personModel1.name.toString());
          print(personModel1.hashCode.toString());
          print(personModel2.name.toString());
          print(personModel2.hashCode.toString());

          Map<String, dynamic> data = {
            'name': null,
          };

          PersonModel model = PersonModel.fromJson(data);

          print(model.name.toString());
          model = model.copyWith(name: 'New Value');
          print(model.name.toString());
        },
      ),
    );
  }
}

