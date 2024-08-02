import 'dart:io';

class UpdateUserRequest {
  UpdateUserRequest(this.name, this.password, this.noTelp, this.file);

  String name;
  String? password;
  String noTelp;
  File file;
}
