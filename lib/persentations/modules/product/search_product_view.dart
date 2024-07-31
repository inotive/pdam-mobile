import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/product_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
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
  String value = '';
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();

  _bind() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          _productViewmodel.updateLimit();
          _productViewmodel.search(value);
        });
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

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
                  setState(() {
                    this.value = value;
                  });
                  _productViewmodel.search(value);
                },
              ),
            ),
            const SpacerWidth(16),
          ],
        ),
      ),
      body: ListView(
        controller: _scrollController,
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
          if (isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: SpinKitCircle(
                  color: ColorApp.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
