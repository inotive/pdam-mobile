import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/vendor_response.dart';
import 'package:pdam_inventory/domain/model/vendor_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension VendorResponseMapper on VendorResponse? {
  VendorModel toDomain() {
    List<VendorDataModel> data =
        (this?.data.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<VendorDataModel>().toList();
    return VendorModel(data);
  }
}

extension VendorDataResponseMapper on VendorDataResponse? {
  VendorDataModel toDomain() {
    return VendorDataModel(
      this?.id.orZero() ?? ZERO,
      this?.name.orEmpty() ?? EMPTY,
      this?.phoneNumber.orEmpty() ?? EMPTY,
      this?.email.orEmpty() ?? EMPTY,
      this?.waNumber.orEmpty() ?? EMPTY,
      this?.website.orEmpty() ?? EMPTY,
      this?.handphone.orEmpty() ?? EMPTY,
      this?.bank.orEmpty() ?? EMPTY,
      this?.accountNumber.orEmpty() ?? EMPTY,
      this?.address.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
    );
  }
}
