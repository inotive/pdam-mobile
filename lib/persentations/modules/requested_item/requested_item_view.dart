import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/viewmodel/requested_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/widgets/requested_item_date_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
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
  void dispose() {
    _requestedViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(
          StringApp.requestedItem,
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _requestedViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {}) ?? _getContentWidget();
          }),
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
      child: Row(
        children: [
          _count(
            12,
            StringApp.totalRequested,
          ),
          const SpacerWidth(8),
          _count(
            12,
            StringApp.totalAgreed,
          ),
          const SpacerWidth(8),
          _count(
            12,
            StringApp.totalPending,
          ),
        ],
      ),
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
