class ValidatorsForm {
  String? isValidEmail(String? text) {
    return _isEmailExp(text ?? "") ? null : "Este email NO es valido";
  }

  String? isValidPass(String? text) {
    if (text == null || text.length < 6) {
      return "Esta contraseña es muy corta";
    }
    return null;
  }

  static bool _isEmailExp(String s) => _hasMatch(
    s,
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  /// Checks with RegExp
  static bool _hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  String? isValidName(String? text) {
    if (text == null || text.length < 4) {
      return "Este nombre es muy corto";
    }
    return null;
  }
}
