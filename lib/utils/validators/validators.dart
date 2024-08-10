class AppValidator {
  static String? validateName (String? name){
    if (name == null || name.isEmpty) {
      return "Username is required!";
    }else if(name.length <= 3){
      return "Username should be at least 4 characters";
    }else{
      return null;
    }
  }

  static String? validatePhone (String? phone){
    if (phone == null || phone.isEmpty) {
      return "Phone Number is required!";
    }else if(phone.length != 11){
      return "Invalid Phone Number";
    }else{
      return null;
    }
  }

  static String? validateEmail (String? email){
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email == null || email.isEmpty) {
      return "Email Address is required!";
    }else if(!emailRegExp.hasMatch(email)){
      return "Invalid Email Address!";
    }else{
      return null;
    }
  }

  static String? validatePassword (String? password){
    if (password == null || password.isEmpty) {
      return "Password is required.";
    }

    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
      return "Password must contain at least one special character.";
    }

    return null;
  }

  static String? validatePassword2 (String? password){
    if (password == null) {
      return null;
    } 

    if (password.isNotEmpty) {
      if (password.length < 6) {
        return "Password must be at least 6 characters long";
      }

      if (!password.contains(RegExp(r'[A-Z]'))) {
        return "Password must contain at least one uppercase letter";
      }

      if (!password.contains(RegExp(r'[0-9]'))) {
        return "Password must contain at least one number";
      }

      if (!password.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
        return "Password must contain at least one special character.";
      }
    }

    return null;
  }
}