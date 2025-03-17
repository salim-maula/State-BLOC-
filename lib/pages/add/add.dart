import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state_bloc/bloc/export.dart';
import 'package:state_bloc/models/user.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD USER'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: nameC,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: ageC,
            decoration: InputDecoration(
              labelText: "Age",
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              userB.add(
                AddUserEvent(
                  User(id: Random().nextInt(999999), age: int.parse(ageC.text), name: nameC.text),
                ),
              );
              Navigator.pop(context);
            },
            child: Text("ADD USER"),
          ),
        ],
      ),
    );
  }
}
