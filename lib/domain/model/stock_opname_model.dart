class StockOpname {
  StockOpname(this.data);

  List<StockOpnameData> data;
}

class StockOpnameData {
  StockOpnameData(
    this.id,
    this.warehouseId,
    this.opnameNumber,
    this.date,
    this.description,
    this.status,
    this.productCount,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.finishedDate,
  );

  int id;
  int warehouseId;
  String opnameNumber;
  String date;
  String description;
  String status;
  int productCount;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String finishedDate;
}

class StockOpnameDetail {
  StockOpnameDetail(this.data);

  StockOpnameDetailData? data;
}

class StockOpnameDetailData {
  StockOpnameDetailData(this.detail, this.products);

  StockOpnameDetailDataDetail? detail;
  List<StockOpnameProductData> products;
}

class StockOpnameDetailDataDetail {
  StockOpnameDetailDataDetail(
    this.id,
    this.warehouseId,
    this.opnameNumber,
    this.date,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.warehouseName,
  );
  int id;
  int warehouseId;
  String opnameNumber;
  String date;
  String description;
  String status;
  String createdAt;
  String updatedAt;
  StockOpnameWarehouseData? warehouseName;
}

class StockOpnameWarehouseData {
  StockOpnameWarehouseData(
    this.id,
    this.name,
    this.description,
    this.pic,
    this.address,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String description;
  int pic;
  String address;
  String createdAt;
  String updatedAt;
}

class StockOpnameProductData {
  StockOpnameProductData(
    this.code,
    this.id,
    this.name,
    this.unitName,
    this.lastStock,
    this.actualStock,
    this.difference,
    this.createdAt,
    this.updatedAt,
  );

  String code;
  int id;
  String name;
  String unitName;
  int lastStock;
  int actualStock;
  int difference;
  String createdAt;
  String updatedAt;
}
