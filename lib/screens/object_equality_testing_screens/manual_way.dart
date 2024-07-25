import 'package:flutter/material.dart';

class ManualWay extends StatelessWidget {
  const ManualWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person = const Person(
            age: '20',
            name: 'Sana',
          );
          Person person1 = const Person(
            age: '20',
            name: 'Sana',
          );
          print(person.hashCode.toString());
          print(person1.hashCode.toString());
          print(person == person1);
          print(person == person);
        },
      ),
    );
  }
}

class Person {
  final String name;
  final String age;

  const Person({
    required this.age,
    required this.name,
  });

  /// To check the equality of object instances.
  /// This code is used to check equality of object parameters.
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Person &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            age == other.age;
  }

  /// This code is used to check equality of hashcodes of object instances.
  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
