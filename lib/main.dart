import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//! cara menggunakan cubit
class CounterCubit extends Cubit<int> {
  //! bisa menggunakan constructor seperti ini atau seperti di bawahnnya
  // CounterCubit(super.initialState);
  CounterCubit() : super(0);

  //! jika tidak mau 0, kita juga bisa set initialData, dengan melemparnya di dalam constructor
  // CounterCubit({this.initialData = 0}) : super(initialData); //! ganti constructor diatas dengan yang ada di bawah
  // int initialData;
  int? current;
  int? next;

  void addData() {
    emit(state + 1);
  }

  void minusData() {
    emit(state - 1);
  }

  //! kelebihan menggunakan Cubit atau Bloc, kita bisa melakukan observer terhadap kelas tersebut
  //! -perubahan(onChange)
  //! -error (onError) dll

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CounterCubit mycounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("CUBIT APPSS"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              //! jika tidak mau menggunakan if == ConnectionState.waiting gunakan initial data
              initialData: 0,
              stream: mycounter.stream,
              builder: (context, snapshot) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        '${snapshot.data}',
                        style: TextStyle(fontSize: 50),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${mycounter.current}',
                        style: TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  mycounter.minusData();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  mycounter.addData();
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
