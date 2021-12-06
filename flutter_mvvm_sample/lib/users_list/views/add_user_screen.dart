import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add User'),
        actions: [
          IconButton(
            onPressed: () async {
              bool userAdded = await usersViewModel.addUser();
              if (!userAdded) {
                return;
              }
              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(hintText: 'Name'),
              onChanged: (val) async {
                usersViewModel.addingUser.name = val;
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (val) async {
                usersViewModel.addingUser.email = val;
              },
            ),
          ],
        ),
      ),
    );
  }
}
