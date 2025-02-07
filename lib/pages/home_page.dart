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
        title: const Text("Bloc Builder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            bloc: mycounter,
            buildWhen: (prev, current) {
              if (current <= -1 && prev <= 0) {
                return false;
              } else {
                return true;
              }
              // return true;
            },
            builder: (context, state) {
              return Text(
                "$state",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          //! selain menggunakan StreamBuilder kita bisa menggunakan widget bawaannya dari package BLOC
          // StreamBuilder(
          //     initialData: 0,
          //     stream: mycounter.stream,
          //     builder: (context, snapshot) {
          //       return Text(
          //         "${snapshot.data}",
          //         style: TextStyle(fontSize: 50),
          //       );
          //     }),
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
