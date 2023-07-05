/// A class containing logic to validate input fields
/// such as email, password, mobile, fullname
class ValidationUtils {
  /// Checks if given email is valid or not
  static bool isValidEmail(String input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    return RegExp(emailRegex).hasMatch(input);
  }

  /// Checks if given email is valid or not
  static bool isValidPassword(String? input) {
    return input != null && input.isNotEmpty && input.length > 5;
  }
}
