class SignUpModel{
  String? name;
  String? email;
  String? password;

  String? validatename(String value){
    if(value.isEmpty){
      return 'please enter the name';
    }else{
      return null;
    }
  }

  String? validateemail(String value){
    if(value.isEmpty){
      return 'Please enter the email';
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
      return 'Enter valid email';
    }else{
      return null;
    }
  }
  String? validatepassword(String value){
    if(value.isEmpty){
      return 'Please enter the password';
    }else if(value.length < 8){
      return 'Password Must be the at least 8 character';
    }else{
      return null;
    }
  }

  void saveuser(String name , String email , String password){
    this.name = name;
    this.email = email;
    this.password = password;
    print("USER DETAILS ::: ${name} , ${password}");
  }

}