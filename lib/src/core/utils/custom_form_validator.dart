class CustomFormValidator {
  CustomFormValidator._();

  static String? validateName(String? value) {
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }

     if (value!.length < 3  ) {
      return "Nome muito pequena.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final validatedEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !validatedEmail.hasMatch(value)) {
      return "Dados inválidos";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
  
    if (value!.length < 6  ) {
      return "Senha muito pequena.";
    }
    return null;
  }

  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Campo obrigatório";
    }
    if (first != second) {
      return "Dados inválidos";
    }
    return null;
  }
}
