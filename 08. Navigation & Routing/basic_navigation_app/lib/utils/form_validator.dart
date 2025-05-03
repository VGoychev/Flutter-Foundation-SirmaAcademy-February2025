class FormValidator {
   static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Enter your name';
    }
    return null;
  }
}