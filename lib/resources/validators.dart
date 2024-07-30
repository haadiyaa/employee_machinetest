class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailReg =
        RegExp(r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}[\s]*$");
    if (!emailReg.hasMatch(value)) {
      return 'Invalid email address!';
    }
    return null;
  }

  static String? passValidator(String? value) {
    final paswd = RegExp(r'^(?=.*\d)[a-zA-Z0-9].{6,}$');
    if (value!.isEmpty) {
      return 'please enter the password';
    } else if (value.length < 6) {
      return 'Please enter atleast 6 characters!';
    } else if (!paswd.hasMatch(value)) {
      return 'Password should contain atleast one digit';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    final name = RegExp(r'^[A-Za-z\s]{3,}[\s]*$');
    if (value!.isEmpty) {
      return 'User name can\'t be empty';
    } else if (!name.hasMatch(value)) {
      return "Enter a valid name";
    }
    return null;
  }
//\d+(?:,\d{3})*(?:\.\d{1,2})?
  static String? ageValidator(String? value) {
    final age = RegExp(r'^[0-9]{1,2}$');
    if (value!.isEmpty) {
      return 'please enter the age';
    } else if (!age.hasMatch(value)) {
      return 'Please enter a valid age';
    }
    return null;
  }
  static String? salaryValidator(String? value) {
    final age = RegExp(r'^\d+(?:,\d{3})*(?:\.\d{1,2})?$');
    if (value!.isEmpty) {
      return 'please enter the salary';
    } else if (!age.hasMatch(value)) {
      return 'Please enter a valid salary';
    }
    return null;
  }
}
