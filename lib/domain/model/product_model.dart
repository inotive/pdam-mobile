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

class ProductDetail {
  ProductDetail(this.data);

  ProductDetailData? data;
}

class ProductDetailData {
  ProductDetailData(
    this.id,
    this.code,
    this.productCategoryId,
    this.name,
    this.min,
    this.max,
    this.createdAt,
    this.updatedAt,
    this.category,
  );

  int id;
  String code;
  String productCategoryId;
  String name;
  String min;
  String max;
  String createdAt;
  String updatedAt;
  CategoryData? category;
}

class ProductSummaryChart {
  ProductSummaryChart(this.inHand, this.outStock, this.inStock);

  int inHand;
  int outStock;
  int inStock;
}

class ProductSummaryData {
  ProductSummaryData(
    this.chart,
    this.totalProduct,
    this.lowStock,
  );

  ProductSummaryChart? chart;
  int totalProduct;
  int lowStock;
}

class ProductSummary {
  ProductSummary(this.data);

  ProductSummaryData? data;
}
