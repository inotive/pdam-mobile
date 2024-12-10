import 'package:pdam_inventory/domain/model/purchase_request_model.dart';

class ReceiveOrder {
  ReceiveOrder(
    this.id,
    this.noBukti,
    this.noRef,
    this.count,
    this.receivedBy,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  int id;
  String noBukti;
  String noRef;
  int count;
  String receivedBy;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
}

class ReceiveOrderDate {
  ReceiveOrderDate(
    this.id,
    this.date,
    this.receiveOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  int id;
  String date;
  List<ReceiveOrder> receiveOrder;
  String createdAt;
  String updatedAt;
  String deletedAt;
}

class ReceiveOrderPagination {
  ReceiveOrderPagination(this.data);

  List<ReceiveOrderDate> data;
}

class ReceiveOrderDetailDataDetail {
  ReceiveOrderDetailDataDetail(
    this.noBukti,
    this.noRef,
    this.date,
    this.receivedBy,
  );

  String noBukti;
  String noRef;
  String date;
  String receivedBy;
}

class ReceiveOrderDetailProduct {
  ReceiveOrderDetailProduct(
    this.code,
    this.id,
    this.name,
    this.unitName,
    this.qty,
    this.price,
    this.pesan,
    this.totalBarangDiterimaSebelumnya,
    this.diterimaDiRak,
    this.diterimaDiGudang,
    this.sisa,
    this.notes,
    this.image,
  );

  String code;
  int id;
  String name;
  String unitName;
  String qty;
  String price;
  String pesan;
  String totalBarangDiterimaSebelumnya;
  String diterimaDiRak;
  String diterimaDiGudang;
  String sisa;
  String notes;
  String image;
}

class ReceiveOrderDetailData {
  ReceiveOrderDetailData(this.detail, this.products);

  ReceiveOrderDetailDataDetail? detail;
  List<ReceiveOrderDetailProduct>? products;
}

class ReceiveOrderDetail {
  ReceiveOrderDetail(this.data);

  ReceiveOrderDetailData? data;
}

class ReceiveOrderWarehouseData {
  ReceiveOrderWarehouseData(
    this.id,
    this.name,
    this.pic,
    this.description,
    this.address,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  int pic;
  String description;
  String address;
  String createdAt;
  String updatedAt;
}

class ReceiveOrderWarehouse {
  ReceiveOrderWarehouse(this.data);

  List<ReceiveOrderWarehouseData> data;
}

class ReceiveOrderReference {
  ReceiveOrderReference(this.data);

  List<PurchaseRequest> data;
}

class ReceiveOrderReferenceDetail {
  ReceiveOrderReferenceDetail(this.data);

  PurchaseRequestDetailData? data;
}

class ReceiveOrderSupplierData {
  ReceiveOrderSupplierData(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
  );

  int id;
  String name;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String deletedAt;
}

class ReceiveOrderSupplier {
  ReceiveOrderSupplier(this.data);

  List<ReceiveOrderSupplierData> data;
}
