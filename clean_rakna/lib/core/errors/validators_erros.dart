abstract class ValidatorsErrors {
  // Validate full name: if it's less than 32 words
  static String? validateFullName(String? value) {
    // Check if the field is empty
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }

    // Remove extra spaces between words
    String cleanedValue = value.trim().replaceAll(RegExp(r'\s+'), ' ');

    // Check if the name is less than 2 words
    List<String> nameParts = cleanedValue.split(' ');
    if (nameParts.length < 2 || nameParts.length > 3) {
      return 'Your full name must contain first and last name';
    }

    // Check if the name contains symbols or numbers
    if (!RegExp(
      r'^[a-zA-Z\s]+$',
    ).hasMatch(cleanedValue)) {
      return 'Your full name must not contain symbols or numbers';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    RegExp emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email == null || email.isEmpty) {
      return 'Please enter your email address';
    } else if (!emailValid.hasMatch(email)) {
      return 'The email address is not valid';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    var regex = RegExp(
        r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.//n])(?=.*[A-Z])(?=.*[a-z]).*$");
    if (password == null || password.isEmpty) {
      return "Please enter your password";
    } else if (!regex.hasMatch(password)) {
      return "The password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number and one special character.";
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    RegExp phoneValid = RegExp(r'^01[0125][0-9]{8}$');
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Please enter your phone number';
    } else if (!phoneValid.hasMatch(phoneNumber)) {
      return 'The phone number is not valid';
    }
    return null;
  }

  static String? validateCarPlateNumber(String? plateNumber) {
    // تعبير منتظم للتحقق من لوحات السيارات المصرية (3 حروف + مسافة + 3 أو 4 أرقام)
    RegExp plateValid = RegExp(
        r'^[\u0621-\u064Aa-zA-Z]{1,3}\s[\u0621-\u064Aa-zA-Z]{1,3}\s[\u0621-\u064Aa-zA-Z]\s[0-9]{3,4}$');
    RegExp(r'^[A-Za-z]{1,3}\s[A-Za-z]{1,3}\s[A-Za-z]\s[0-9]{3,4}$');

    if (plateNumber == null || plateNumber.isEmpty) {
      return 'Please enter the car plate number';
    } else if (!plateValid.hasMatch(plateNumber)) {
      return 'The car plate number is not valid';
    }

    return null;
  }

  static String? validateTermsAndConditions(bool? value) {
    if (value == null || !value) {}
    return null;
  }
}
