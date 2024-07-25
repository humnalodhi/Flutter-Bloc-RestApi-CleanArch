import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UsingEquatablePackage extends StatelessWidget {
  const UsingEquatablePackage({super.key});

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

class Person extends Equatable {
  final String name;
  final String age;

  const Person({
    required this.age,
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
        age,
      ];
}
