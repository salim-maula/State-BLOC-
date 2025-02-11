import 'package:flutter/material.dart';
import 'package:state_bloc/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: BlocBuilder(
            bloc: counter,
            builder: (context, state) {
              return Text(
                "$state",
                style: TextStyle(fontSize: 50),
              );
            }),
      ),
    );
  }
}
