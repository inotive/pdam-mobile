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

  int? id;
  String? warehouseId;
  String? opnameNumber;
  String? date;
  String? description;
  String? status;
  String? productCount;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? finishedDate;
}
