import 'package:pdam_inventory/domain/model/user_model.dart';

class Login {
  Login(this.data, this.token);

  UserData? data;
  TokenData? token;
}

class TokenData {
  TokenData(
    this.expiresIn,
    this.accessToken,
    this.tokenType,
  );

  int expiresIn;
  String accessToken;
  String tokenType;
}
