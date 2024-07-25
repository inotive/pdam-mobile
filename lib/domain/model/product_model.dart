import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';

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
    this.qty,
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
  ValueNotifier<int> qty;
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

class ProductWarehouseData {
  ProductWarehouseData(
    this.name,
    this.currentStock,
  );

  String name;
  String currentStock;
}

class ProductWarehouse {
  ProductWarehouse(this.data);

  List<ProductWarehouseData> data;
}

class ProductStockHistoryData {
  ProductStockHistoryData(
    this.lastStock,
    this.qty,
    this.currentStock,
    this.createdAt,
    this.type,
    this.date,
  );

  String lastStock;
  String qty;
  String currentStock;
  String createdAt;
  String type;
  String date;
}

class ProductStockHistory {
  ProductStockHistory(this.data);

  List<ProductStockHistoryData> data;
}

class ProductByWarehouse {
  ProductByWarehouse(this.data);

  List<PurchaseRequestProduct> data;
}
