class AppValidators {
  /// Palestinian ID validation
  static String? validateId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال رقم الهوية';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'رقم الهوية يجب أن يحتوي على أرقام فقط';
    }

    if (value.length != 9) {
      return 'رقم الهوية يجب أن يتكون من 9 أرقام';
    }

    if (!_isValidPalestinianId(value)) {
      return 'رقم الهوية غير صحيح';
    }

    return null;
  }

  /// Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }

    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }

    return null;
  }

  /// ID checksum logic
  static bool _isValidPalestinianId(String value) {
    int sum = 0;

    for (int i = 0; i < value.length; i++) {
      int digit = int.parse(value[i]);
      int step = digit * ((i % 2) + 1);

      if (step > 9) {
        step = (step ~/ 10) + (step % 10);
      }

      sum += step;
    }

    return sum % 10 == 0;
  }
}
