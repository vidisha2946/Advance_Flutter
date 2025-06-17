import '../model/signup_model.dart';
class SignUpController{
  SignUpModel _signUpModel = SignUpModel();

  String? validatename(String value) => _signUpModel.validatename(value);
  String? validateemail(String value) => _signUpModel.validateemail(value);
  String? validatepassword(String value) => _signUpModel.validatepassword(value);

  void saveuser(String name , String email ,String password) => _signUpModel.saveuser(name, email, password);
}