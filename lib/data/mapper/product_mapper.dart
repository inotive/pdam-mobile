import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/product_response.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
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
