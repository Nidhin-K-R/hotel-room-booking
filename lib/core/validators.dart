class AppValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter your name";
    }
    if (value.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter your phone number";
    }
    if (value.length < 10) {
      return "Phone number must be at least 10 digits long";
    }
    if (value.length > 15) {
      return "Phone number must be at most 15 digits long";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Phone number must contain only digits";
    }
    return null;
  }

  static String? validateCheckInDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your check-in date';
    }
    return null;
  }

  static String? validateCheckOutDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your check-out date';
    }
    return null;
  }
}
