import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/viewmodel/requested_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/widgets/detail_requested_item_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class RequestedDetailItemView extends StatefulWidget {
  const RequestedDetailItemView({super.key, required this.id});

  final int id;

  @override
  State<RequestedDetailItemView> createState() => _RequestedDetailItemViewState();
}

class _RequestedDetailItemViewState extends State<RequestedDetailItemView> {
  final RequestedDetailViewModel _requestedDetailViewModel = instance<RequestedDetailViewModel>();

  _bind() {
    _requestedDetailViewModel.detail(widget.id);
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _requestedDetailViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringApp.detailRequestedItem,
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _requestedDetailViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
                  _bind();
                }) ??
                Container();
          }),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<PurchaseRequestDetailData>(
        stream: _requestedDetailViewModel.outputPurchaseDetailRequest,
        builder: (context, snapshot) {
          List<PurchaseRequestProduct> products = snapshot.data?.products ?? List.empty();
          return ListView(
            children: [
              _product(snapshot.data?.detail),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: products.isEmpty
                    ? const EmptyCard(
                        message: StringApp.productNotYet,
                      )
                    : Column(
                        children: products.map((item) {
                          return DetailRequestedItemCard(item);
                        }).toList(),
                      ),
              ),
            ],
          );
        });
  }

  Container _product(PurchaseRequest? purchase) {
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    purchase?.requestNumber ?? '-',
                    style: StyleApp.textXl.copyWith(
                      color: ColorApp.blackText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SpacerHeight(6),
                  Text(
                    purchase?.createdAt == EMPTY ? '-' : purchase?.createdAt.toString() ?? '',
                    style: StyleApp.textNormal.copyWith(
                      color: ColorApp.greyText,
                    ),
                  ),
                ],
              ),
              status(purchase?.status ?? EMPTY),
            ],
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
                  purchase?.createdBy.getInitials() ?? EMPTY,
                  style: StyleApp.textNormal.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorApp.white,
                  ),
                ),
              ),
              const SpacerWidth(8),
              Text(
                purchase?.createdBy ?? EMPTY,
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

  Widget status(String status) {
    switch (status) {
      case 'Batal':
        return CustomBadge(
          backgroundColor: ColorApp.redBg,
          textColor: ColorApp.red,
          text: status.toTitleCase(),
        );
      case 'Menunggu Disetujui':
        return CustomBadge(
          backgroundColor: ColorApp.yellow.withOpacity(0.1),
          textColor: ColorApp.yellow,
          text: status.toTitleCase(),
        );
      case 'Sedang Purchase Order':
        return CustomBadge(
          backgroundColor: ColorApp.brownBg,
          textColor: ColorApp.brown,
          text: status.toTitleCase(),
        );
      case 'Disetujui':
        return CustomBadge(
          text: status.toTitleCase(),
        );
      default:
        return CustomBadge(
          text: status.toTitleCase(),
        );
    }
  }
}
