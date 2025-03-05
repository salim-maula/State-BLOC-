import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/counter.dart';
import 'package:state_bloc/bloc/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! Extention Method
    //? 1. context read()
    //? 2. context watch()
    //? 3. context select()
    // CounterBloc myCounter = context.read<CounterBloc>(); //* Hanaya membaca 1x (pertama kali)
    // CounterBloc myCounter = context.watch<CounterBloc>(); //* membaca berkali-kali (ketika state pada bloc berubah)

    //! membaca berkali-kali (ketika state pada bloc berubah)
    // String nameUser = context.select<UserBloc, String>((value) => value.state['name']);
    // int agenUser = context.select<UserBloc, int>((value) => value.state['age']);
    print('BUILD SCAFFOLD');
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              String nameUser = context.select<UserBloc, String>((value) => value.state["name"]);
              print("BUILD TEXT NAMA");
              return Text("NAMA: $nameUser");
            }),
            Builder(builder: (context) {
              int ageUser = context.select<UserBloc, int>((value) => value.state["age"]);
              print("BUILD TEXT UMUR");
              return Text("UMUR: $ageUser");
            }),
            // BlocBuilder<CounterBloc, int>(
            //   bloc: myCounter,
            //   builder: (context, state) {
            //     return Text(
            //       "$state",
            //       style: TextStyle(
            //         fontSize: 50,
            //       ),
            //     );
            //   },
            // ),
            // Text(
            //   '${myCounter.state}',
            //   style: const TextStyle(fontSize: 100),
            // ),
            // Builder(builder: (context) {
            //   CounterBloc myCounter = context.watch<CounterBloc>();
            //   return Text(
            //     '${myCounter.state}',
            //     style: const TextStyle(fontSize: 100),
            //   );
            // }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<UserBloc>().changeAge(context.read<UserBloc>().state['age']);
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    context.read<UserBloc>().changeName(context.read<UserBloc>().state['name']);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
