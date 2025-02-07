import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter mycounter = Counter();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Listener"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: mycounter,
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(fontSize: 50),
              );
            },
            buildWhen: (previous, current) {
              if (current == 10) {
                return true;
              } else {
                return false;
              }
            },
            listener: (context, state) {
              //....
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("SUDAH MENCAPAI 15"),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current == 15) {
                return true;
              } else {
                return false;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  mycounter.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  mycounter.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
