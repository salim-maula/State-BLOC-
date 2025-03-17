import 'package:flutter/material.dart';
import 'package:state_bloc/bloc/export.dart';
import 'package:state_bloc/models/user.dart';
import 'package:state_bloc/pages/add/add.dart';
import 'package:state_bloc/pages/edit/edit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userB,
        builder: (context, state) {
          if (state.allUsers.isEmpty) {
            return Center(
              child: Text('TIDAK ADA DATA'),
            );
          }
          return ListView.builder(
            itemCount: state.allUsers.length,
            itemBuilder: (context, index) {
              User user = state.allUsers[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPage(user),
                    ),
                  );
                },
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(user.name),
                subtitle: Text("${user.age} tahun"),
                trailing: IconButton(
                    onPressed: () {
                      //TODO
                      userB.add(DeleteUserEvent(user));
                    },
                    icon: Icon(Icons.delete)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
