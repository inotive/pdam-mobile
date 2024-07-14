import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/user_response.dart';
import 'package:pdam_inventory/domain/model/user_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension UserDataResponseMapper on UserDataResponse? {
  UserData toDomain() {
    return UserData(
        this?.id.orZero() ?? ZERO,
        this?.name.orEmpty() ?? EMPTY,
        this?.email.orEmpty() ?? EMPTY,
        this?.emailVerifiedAt.orEmpty() ?? EMPTY,
        this?.createdAt.orEmpty() ?? EMPTY,
        this?.updatedAt.orEmpty() ?? EMPTY,
        this?.roleId.orEmpty() ?? EMPTY,
        this?.username.orEmpty() ?? EMPTY,
        this?.role.toDomain());
  }
}

extension RoleDataResponseMapper on RoleDataResponse? {
  RoleData toDomain() {
    return RoleData(
      this?.id.orZero() ?? ZERO,
      this?.name.orEmpty() ?? EMPTY,
      this?.guardName.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
    );
  }
}
