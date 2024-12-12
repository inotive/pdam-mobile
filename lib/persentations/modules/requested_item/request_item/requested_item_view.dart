import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/viewmodel/requested_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/widgets/requested_item_date_card.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/widgets/requested_item_skeleton.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class RequestedItemView extends StatefulWidget {
  const RequestedItemView({super.key});

  @override
  State<RequestedItemView> createState() => _RequestedItemViewState();
}

class _RequestedItemViewState extends State<RequestedItemView> {
  final RequestedViewModel _requestedViewModel = instance<RequestedViewModel>();

  _bind() {
    _requestedViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(
          StringApp.requestedItem,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SearchInputField(
              hint: StringApp.search,
              readOnly: true,
              onTap: () => Navigator.pushNamed(context, Routes.searchRequestedItem),
              suffixIcon: const Icon(
                Icons.search,
                color: ColorApp.black,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorApp.blue,
        onPressed: () => Navigator.pushNamed(context, Routes.createRequestItem),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.add,
          color: ColorApp.white,
        ),
      ),
      body: _getContentWidget(),
      // body: StreamBuilder<FlowState>(
      //     stream: _requestedViewModel.outputState,
      //     builder: (context, snapshot) {
      //       return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
      //             _bind();
      //           }) ??
      //           Container();
      //     }),
    );
  }

  ListView _getContentWidget() {
    return ListView(
      children: [
        _total(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringApp.historyRequestedItem,
                style: StyleApp.textLg.copyWith(
                  color: ColorApp.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SpacerHeight(16),
              StreamBuilder<List<PurchaseRequestDate>>(
                  stream: _requestedViewModel.outputPurchaseRequest,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? List.empty();

                    if (ConnectionState.waiting == snapshot.connectionState) {
                      return const RequestedItemSkeleton();
                    }

                    if (data.isEmpty) {
                      return const EmptyCard(
                        message: "${StringApp.requestedItemNotYet}!",
                      );
                    }

                    return Column(
                      children: data.map((item) {
                        return RequestedItemDateCard(item);
                      }).toList(),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Container _total() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        color: ColorApp.white,
      ),
      child: StreamBuilder<PurchaseRequestSummaryData>(
          stream: _requestedViewModel.outputPurchaseSummaryRequest,
          builder: (context, snapshot) {
            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Row(
                children: [
                  Flexible(
                    child: ShimmerWidget(
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                  SpacerWidth(8),
                  Flexible(
                    child: ShimmerWidget(
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                  SpacerWidth(8),
                  Flexible(
                    child: ShimmerWidget(
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                ],
              );
            }

            return Row(
              children: [
                _count(
                  snapshot.data?.totalRequested ?? 0,
                  StringApp.totalRequested,
                ),
                const SpacerWidth(8),
                _count(
                  snapshot.data?.totalAgreed ?? 0,
                  StringApp.totalAgreed,
                ),
                const SpacerWidth(8),
                _count(
                  snapshot.data?.totalPending ?? 0,
                  StringApp.totalPending,
                ),
              ],
            );
          }),
    );
  }

  Flexible _count(int value, String text) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 32),
        decoration: BoxDecoration(
          color: ColorApp.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value.toString(),
              style: StyleApp.text2xl.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorApp.blackText,
              ),
            ),
            const SpacerHeight(6),
            Text(
              text,
              style: StyleApp.textNormal.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorApp.blackText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
