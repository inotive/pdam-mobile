import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/mapper/purchase_request_mapper.dart';
import 'package:pdam_inventory/data/responses/product_response.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension ProductResponseMapper on ProductResponse? {
  Product toDomain() {
    List<ProductData> products =
        (this?.data?.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<ProductData>().toList();

    return Product(products);
  }
}

extension ProductDataResponseMapper on ProductDataResponse? {
  ProductData toDomain() {
    ValueNotifier<int> qty = ValueNotifier<int>(1);
    return ProductData(
      this?.id.orZero() ?? ZERO,
      this?.name.orEmpty() ?? EMPTY,
      this?.code.orEmpty() ?? EMPTY,
      this?.currentStock.orZero() ?? ZERO,
      this?.stockIn.orZero() ?? ZERO,
      this?.stockOut.orZero() ?? ZERO,
      this?.image.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      qty,
    );
  }
}

extension ProductDetailDataResponseMapper on ProductDetailDataResponse? {
  ProductDetailData toDomain() {
    return ProductDetailData(
      this?.id.orZero() ?? ZERO,
      this?.name.orEmpty() ?? EMPTY,
      this?.code.orEmpty() ?? EMPTY,
      this?.currentStock.orZero() ?? ZERO,
      this?.stockIn.orZero() ?? ZERO,
      this?.stockOut.orZero() ?? ZERO,
      this?.image.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
    );
  }
}

extension ProductDetailResponseMapper on ProductDetailResponse? {
  ProductDetail toDomain() {
    return ProductDetail(this?.data?.toDomain());
  }
}

extension ProductSummaryChartResponseMapper on ProductSummaryChartResponse? {
  ProductSummaryChart toDomain() {
    return ProductSummaryChart(
      this?.inHand.orZero() ?? ZERO,
      this?.outStock.orZero() ?? ZERO,
      this?.inStock.orZero() ?? ZERO,
    );
  }
}

extension ProductSummaryDataResponseMapper on ProductSummaryDataResponse? {
  ProductSummaryData toDomain() {
    return ProductSummaryData(
      this?.chart.toDomain(),
      this?.totalProduct.orZero() ?? ZERO,
      this?.lowStock.orZero() ?? ZERO,
    );
  }
}

extension ProductSummaryResponseMapper on ProductSummaryResponse? {
  ProductSummary toDomain() {
    return ProductSummary(this?.data?.toDomain());
  }
}

extension ProductWarehouseDataResponseMapper on ProductWarehouseDataResponse? {
  ProductWarehouseData toDomain() {
    return ProductWarehouseData(
      this?.name.orEmpty() ?? EMPTY,
      this?.currentStock.orEmpty() ?? EMPTY,
    );
  }
}

extension ProductWarehouseResponseMapper on ProductWarehouseResponse? {
  ProductWarehouse toDomain() {
    List<ProductWarehouseData> products =
        (this?.data?.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<ProductWarehouseData>().toList();

    return ProductWarehouse(products);
  }
}

extension ProductStockHistoryDataResponseMapper on ProductStockHistoryDataResponse? {
  ProductStockHistoryData toDomain() {
    return ProductStockHistoryData(
      this?.lastStock.orEmpty() ?? EMPTY,
      this?.qty.orEmpty() ?? EMPTY,
      this?.currentStock.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.type.orEmpty() ?? EMPTY,
      this?.date.orEmpty() ?? EMPTY,
    );
  }
}

extension ProductStockHistoryResponseMapper on ProductStockHistoryResponse? {
  ProductStockHistory toDomain() {
    List<ProductStockHistoryData> products =
        (this?.data?.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<ProductStockHistoryData>().toList();

    return ProductStockHistory(products);
  }
}

extension ProductByWarehouseResponseMapper on ProductByWarehouseResponse? {
  ProductByWarehouse toDomain() {
    List<PurchaseRequestProduct> products =
        (this?.data.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<PurchaseRequestProduct>().toList();

    return ProductByWarehouse(products);
  }
}
