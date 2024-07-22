import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductWarehouseStockTab extends StatefulWidget {
  final ProductDetailViewmodel productDetailViewmodel;
  const ProductWarehouseStockTab(this.productDetailViewmodel, {super.key});

  @override
  State<ProductWarehouseStockTab> createState() => _ProductWarehouseStockTabState();
}

class _ProductWarehouseStockTabState extends State<ProductWarehouseStockTab> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 6.0, 16.0),
      child: Scrollbar(
        controller: _scrollController,
        trackVisibility: true,
        thumbVisibility: true,
        radius: const Radius.circular(4),
        thickness: 4.0,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16.0, 0, 10.0, 0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: StreamBuilder<List<ProductWarehouseData>>(
                stream: widget.productDetailViewmodel.outputProductWarehouse,
                builder: (context, snapshot) {
                  List<ProductWarehouseData> data = snapshot.data ?? List<ProductWarehouseData>.empty();

                  if (ConnectionState.waiting == snapshot.connectionState) {
                    return Column(
                      children: [
                        ...List.generate(3, (idx) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShimmerWidget(
                                  width: 180,
                                  height: 14,
                                ),
                                ShimmerWidget(
                                  width: 40,
                                  height: 14,
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    );
                  }

                  if (data.isEmpty) {
                    return const EmptyCard(message: StringApp.warehouseStockNotYet);
                  }

                  return Column(
                    children: data.map((item) => _item(item.name, item.currentStock)).toList(),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Padding _item(String name, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: StyleApp.textNormal.copyWith(
                color: ColorApp.greyText,
              ),
            ),
          ),
          const SpacerWidth(8),
          Text(
            value == EMPTY ? "0" : value,
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.blackText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
