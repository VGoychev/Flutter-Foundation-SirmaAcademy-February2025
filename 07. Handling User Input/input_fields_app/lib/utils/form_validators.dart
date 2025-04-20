class FormValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your email';
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$');
    return emailRegex.hasMatch(value) ? null : 'Enter a valid email';
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Password cannot be empty';
    }
    if(value.length < 6){
      return 'Password must be atleast 6 symbols';
    }
    return null;
  }
}
