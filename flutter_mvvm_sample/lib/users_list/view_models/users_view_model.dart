import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample/users_list/models/user_error.dart';
import 'package:flutter_mvvm_sample/users_list/models/users_list_model.dart';
import 'package:flutter_mvvm_sample/users_list/repo/api_status.dart';
import 'package:flutter_mvvm_sample/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? _userError;
  UserError? get userError => _userError;
  UserModel? _selectUser;
  UserModel? get selectUser => _selectUser;
  UserModel _addingUser = UserModel();
  UserModel get addingUser => _addingUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectUser(UserModel userModel) {
    _selectUser = userModel;
  }

  addUser() async {
    if (!isValid()) {
      return;
    }

    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name == null) {
      return false;
    }
    if (addingUser.name!.isEmpty) {
      return false;
    }
    if (addingUser.email == null) {
      return false;
    }
    if (addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);

    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }

    if (response is Failure) {
      UserError userError = UserError(code: response.code, message: response.errorResponse as String);
      setUserError(userError);
    }

    setLoading(false);
  }
}