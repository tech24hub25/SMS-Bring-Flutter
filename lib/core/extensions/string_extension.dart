extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(
      r"^\+?[0-9]{10,15}$", // دعم الأرقام الدولية مع أو بدون علامة "+"
    );
    return phoneRegExp.hasMatch(this);
  }

  // التحقق إذا كانت كلمة المرور تحتوي على حرف كبير
  bool get hasUpperCase {
    return RegExp(r'[A-Z]').hasMatch(this);
  }

  // التحقق إذا كانت كلمة المرور تحتوي على حرف صغير
  bool get hasLowerCase {
    return RegExp(r'[a-z]').hasMatch(this);
  }

  // التحقق إذا كانت كلمة المرور تحتوي على رقم
  bool get hasNumber {
    return RegExp(r'[0-9]').hasMatch(this);
  }

  // التحقق إذا كانت كلمة المرور تحتوي على رمز خاص
  bool get hasSpecialCharacter {
    return RegExp(r'[!@#\$&*~]').hasMatch(this);
  }

  // التحقق من طول كلمة المرور
  bool get hasMinLength {
    return this.length >= 8;
  }

  // التحقق النهائي إذا كانت كلمة المرور صالحة
  bool get isValidPassword {
    return hasUpperCase &&
        hasLowerCase &&
        hasNumber &&
        hasSpecialCharacter &&
        hasMinLength;
  }
}
