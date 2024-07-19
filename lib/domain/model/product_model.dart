class Product {
  Product(this.data);

  List<ProductData> data;
}

class ProductData {
  ProductData(
    this.id,
    this.name,
    this.code,
    this.currentStock,
    this.stockIn,
    this.stockOut,
    this.image,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String code;
  int currentStock;
  int stockIn;
  int stockOut;
  String image;
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
    this.name,
    this.code,
    this.currentStock,
    this.stockIn,
    this.stockOut,
    this.image,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String code;
  int currentStock;
  int stockIn;
  int stockOut;
  String image;
  String createdAt;
  String updatedAt;
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
