import 'dart:io';

class UpdateUserInput {
  UpdateUserInput(this.name, this.password, this.noTelp, this.file);

  String name;
  String? password;
  String noTelp;
  File file;
}
