import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample/users_list/models/users_list_model.dart';
import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final GestureTapCallback onTap;
  const UserListRow({required this.userModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: userModel.name ?? 'No Name'),
            Text(
              userModel.email ?? 'No Email',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}