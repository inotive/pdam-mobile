import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/product_card.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class SearchProductView extends StatefulWidget {
  const SearchProductView({super.key});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  final ProductViewmodel _productViewmodel = instance<ProductViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Flexible(
              child: SearchInputField(
                hint: StringApp.searchItem,
                onChanged: (String value) {
                  _productViewmodel.search(value);
                },
              ),
            ),
            SpacerWidth(16),
          ],
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder(
            stream: _productViewmodel.outputProductsSearch,
            builder: (context, snapshot) {
              final data = snapshot.data ?? List.empty();

              if (data.isEmpty) {
                return const EmptyCard(
                  message: StringApp.productNotYet,
                );
              }

              return Column(
                  children: data
                      .map(
                        (item) => ProductCard(item),
                      )
                      .toList());
            },
          ),
        ],
      ),
    );
  }
}
