class VendorModel {
  VendorModel(this.data);

  List<VendorDataModel> data;
}

class VendorDataModel {
  VendorDataModel(
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.waNumber,
    this.website,
    this.handphone,
    this.bank,
    this.accountNumber,
    this.address,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String phoneNumber;
  String email;
  String waNumber;
  String website;
  String handphone;
  String bank;
  String accountNumber;
  String address;
  String createdAt;
  String updatedAt;
}
