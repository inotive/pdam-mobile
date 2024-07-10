import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductWarehouseStockTab extends StatefulWidget {
  const ProductWarehouseStockTab({super.key});

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
            child: Column(
              children: [
                ...List.generate(100, (index) {
                  return _item('Gudang IPA Kudungga Sangatta Utara', '5 Buah');
                })
              ],
            ),
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
            value,
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
