import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/authentication_response.dart';
import 'package:pdam_inventory/domain/model/authentication_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension TokenResponseMapper on TokenResponse? {
  TokenData toDomain() {
    return TokenData(
      this?.expiresIn.orZero() ?? ZERO,
      this?.accessToken.orEmpty() ?? EMPTY,
      this?.tokenType.orEmpty() ?? EMPTY,
    );
  }
}
