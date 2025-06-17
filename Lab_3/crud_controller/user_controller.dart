import '../utils/impoer_export.dart';
class UserCrudController{
  final List<UserModel> _userList = [];

  get getUser => _userList;

  void addUser(UserModel user){
    _userList.add(user);
    print("User is added into the list");
  }

  void deleteUser(UserModel user){
    _userList.removeWhere((element) => element.name == user.name);
  }

  void editUser(UserModel oldUser , UserModel newUser){
    int index = _userList.indexWhere((element) => element.name == oldUser.name);
    _userList[index] = newUser;
  }

  void displayUser(){

  }
}