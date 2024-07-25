import 'dart:math';

class HelperApp {
  static String generateRandomString(int length) {
    const String charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+';

    Random random = Random();
    String text = '';

    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(charset.length);
      text += charset[randomIndex];
    }

    return text;
  }
}
