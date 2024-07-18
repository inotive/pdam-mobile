import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/viewmodel/receive_order_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/widgets/detail_accepted_item_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class DetailAcceptedItemView extends StatefulWidget {
  const DetailAcceptedItemView({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetailAcceptedItemView> createState() => _DetailAcceptedItemViewState();
}

class _DetailAcceptedItemViewState extends State<DetailAcceptedItemView> {
  final ReceiveOrderDetailViewmodel _orderDetailViewmodel = instance<ReceiveOrderDetailViewmodel>();

  _bind() {
    _orderDetailViewmodel.receiveOrderDetail(widget.id);
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
        title: const Text(StringApp.detailAcceptedItem),
      ),
      body: StreamBuilder<FlowState>(
          stream: _orderDetailViewmodel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () {
                  _bind();
                }) ??
                Container();
          }),
    );
  }

  StreamBuilder _getContentWidgets() {
    return StreamBuilder<ReceiveOrderDetailData>(
        stream: _orderDetailViewmodel.outputReceiveOrderDetail,
        builder: (context, snapshot) {
          List<ReceiveOrderDetailProduct> products = snapshot.data?.products ?? List.empty();
          return ListView(
            children: [
              _header(snapshot.data?.detail),
              const SpacerHeight(6),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: products.map((item) {
                    return DetailAcceptedItemCard(item);
                  }).toList(),
                ),
              ),
            ],
          );
        });
  }

  Container _header(ReceiveOrderDetailDataDetail? data) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        border: DashedBorder(
          dashLength: 4,
          bottom: BorderSide(
            width: 1,
            color: ColorApp.border,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data?.noBukti ?? '',
            style: StyleApp.textXl.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorApp.blackText,
            ),
          ),
          const SpacerHeight(6),
          Text(
            data?.noRef ?? '',
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
          ),
          const SpacerHeight(6),
          Text(
            data?.date ?? '',
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
          ),
          const SpacerHeight(6),
          Row(
            children: [
              Container(
                height: 24,
                width: 24,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(8, 1.5, 8, 2.5),
                decoration: const BoxDecoration(color: ColorApp.primary, shape: BoxShape.circle),
                child: Text(
                  data?.receivedBy.getInitials() ?? '',
                  style: StyleApp.textNormal.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorApp.white,
                  ),
                ),
              ),
              const SpacerWidth(8),
              Text(
                data?.receivedBy ?? '',
                style: StyleApp.textNormal.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
