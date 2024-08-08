import 'dart:math';

import 'package:pdam_inventory/app/config_app.dart';

class HelperApp {
  static String generateRandomString(int length) {
    const String charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    Random random = Random();
    String text = '';

    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(charset.length);
      text += charset[randomIndex];
    }

    return text;
  }

  static String getUrlImage(String url) {
    if (url.startsWith("https://")) {
      return url;
    } else {
      return "${ConfigApp.imageUrl}$url";
    }
  }
}
