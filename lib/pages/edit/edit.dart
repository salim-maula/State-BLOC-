import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/user/user_bloc.dart';
import 'package:state_bloc/models/user.dart';

class EditPage extends StatelessWidget {
  EditPage(this.user, {super.key});

  final User user;
  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    nameC.text = user.name;
    ageC.text = user.age.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit USER'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: nameC,
            decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder()),
          ),
          TextField(
            controller: ageC,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Age", border: OutlineInputBorder()),
          ),
          ElevatedButton(
            onPressed: () {
              userB.add(
                EditUserEvent(
                  User(id: user.id, age: int.parse(ageC.text), name: nameC.text),
                ),
              );

              Navigator.pop(context);
            },
            child: Text("EDIT USER"),
          ),
        ],
      ),
    );
  }
}
