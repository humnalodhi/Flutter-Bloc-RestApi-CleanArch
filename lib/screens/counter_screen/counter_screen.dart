import 'package:bloc_rest_api_clean_arch/bloc/counter/counter_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/counter/counter_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/counter/counter_state.dart';
import 'package:bloc_rest_api_clean_arch/screens/posts_screen/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc counterBloc;

  @override
  void initState() {
    super.initState();
    counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostsScreen(),
                  ),
                );
              },
              child: const Text('Next'),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: const TextStyle(
                    fontSize: 60,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: const Text('Increment'),
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: const Text('Decrement'),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
