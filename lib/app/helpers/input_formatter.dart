import 'package:flutter/services.dart';

class InputFormatterApp {
  static TextInputFormatter stringEmojiFormatter() {
    return FilteringTextInputFormatter(
      RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
      allow: false,
    );
  }
}
