import 'package:equatable/equatable.dart';

/// Abstract classes act as base class and implements the functionality for its sub classes.
/// It defines the behavior and interface which are implemented by the sub classes.
/// You cannot initialize abstract classes.
abstract class CounterEvent extends Equatable{

  const CounterEvent();
  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent{

}

class DecrementCounter extends CounterEvent{

}
