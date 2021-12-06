import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample/users_list/components/app_error.dart';
import 'package:flutter_mvvm_sample/users_list/components/app_loading.dart';
import 'package:flutter_mvvm_sample/users_list/components/user_list_row.dart';
import 'package:flutter_mvvm_sample/users_list/models/users_list_model.dart';
import 'package:flutter_mvvm_sample/users_list/utils/navigation_utils.dart';
import 'package:flutter_mvvm_sample/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        )
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return AppError(
        errorText: usersViewModel.userError?.message,
      );
    }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return UserListRow(
                userModel: userModel,
                onTap: () async {
                  usersViewModel.setSelectUser(userModel);
                  openUserDetails(context);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: usersViewModel.userListModel.length,
        ),
    );
  }


}