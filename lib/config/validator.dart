class Validator {

  static String emailValidation(String email) {
    const pattern = r"^[a-zA-Z0-9.a-zA-Z0-9._+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regExp = RegExp(pattern);
    // const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    // final regExp = RegExp(pattern);
    if (email.isEmpty) {
      return "Please enter your mail";
    } else if (email.contains(' ')) {
      return 'Email can\'t accept Space';
    } else if (!regExp.hasMatch(email)) {
      return 'Not a valid email address. Should be your your@gmail.com';
    } else {
      return '';
    }
  }


  static String validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return '';
      }
    }
  }

  static String nameValidation(String name) {
    if (name.isEmpty) {
      return 'Please enter your name';
    } else {
      return '';
    }
  }

}
