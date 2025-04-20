class FormValidation {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Enter your name';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Enter your email';
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$');
    return emailRegex.hasMatch(email) ? null : 'Enter a valid email';
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 6) {
      return 'Password has to be atleast 6 symbols';
    }

    return null;
  }
}
