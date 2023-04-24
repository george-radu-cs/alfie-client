const minNameLength = 3;
const minPasswordLength = 12;
const validateEmailRegex = r"^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$";
const validatePasswordRegex = r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&\(\)\[\]<>%^-_=+*~]).{12,}$";

bool isEmailValid(String? email) {
  if (email == null || email.isEmpty) return false;
  return RegExp(validateEmailRegex).hasMatch(email);
}

bool isPasswordValid(String? password) {
  if (password == null || password.isEmpty) return false;
  return RegExp(validatePasswordRegex).hasMatch(password);
}

bool isConfirmPasswordValid(String? password, String? confirmPassword) {
  if (password == null || password.isEmpty || confirmPassword == null || confirmPassword.isEmpty) return false;
  return password == confirmPassword;
}

bool isNameValid(String? name) {
  return name != null && name.isNotEmpty && name.length >= minNameLength;
}
