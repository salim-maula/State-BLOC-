import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/counter.dart';
import 'package:state_bloc/other/other.dart';
import 'package:state_bloc/pages/data_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Counter mycounter = Counter();
    Counter mycounter = BlocProvider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Listener"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    // mycounter.decrement();
                    mycounter.decrement();
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: const SizedBox(
                    width: 70,
                    height: 100,
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              DataWidget(),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    mycounter.increment();
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: const SizedBox(
                    width: 70,
                    height: 100,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            // MaterialPageRoute(
            //   builder: (context) => BlocProvider(
            //     create: (context) => mycounter,
            //     child: OtherPage(),
            //   ),
            // ),

            //! jika kita mau menginjek kehalaman berikutnya jgn gunakan cara di atas
            //! gunakana BlocProvider.value
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: mycounter,
                child: OtherPage(),
              ),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
