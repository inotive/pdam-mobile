class Product {
  Product(this.data);

  List<ProductData> data;
}

class ProductData {
  ProductData(
    this.id,
    this.unit,
    this.category,
    this.name,
    this.code,
    this.min,
    this.max,
    this.stock,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  UnitData? unit;
  CategoryData? category;
  String name;
  String code;
  String min;
  String max;
  int stock;
  String createdAt;
  String updatedAt;
}

class CategoryData {
  CategoryData(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String createdAt;
  String updatedAt;
}

class UnitData {
  UnitData(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String createdAt;
  String updatedAt;
}
