import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample/users_list/components/app_title.dart';
import 'package:flutter_mvvm_sample/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(usersViewModel.selectUser?.name ?? 'No Name'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: usersViewModel.selectUser?.name ?? 'No Name'),
            Text(
              usersViewModel.selectUser?.email ?? 'No Email',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
