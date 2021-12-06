import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample/users_list/views/add_user_screen.dart';
import 'package:flutter_mvvm_sample/users_list/views/user_detail_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetailScreen(),
    )
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUserScreen(),
      )
  );
}
