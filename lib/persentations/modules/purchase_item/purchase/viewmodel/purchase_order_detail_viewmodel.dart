// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/domain/usecase/purchase_order/purchase_order_detail_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class PurchaseOrderDetailViewmodel extends BaseViewModel
    implements PurchaseOrderDetailViewmodelInputs, PurchaseOrderDetailViewmodelOutputs {
  final PurchaseOrderDetailUsecase _purchaseOrderDetailUsecase;
  PurchaseOrderDetailViewmodel(this._purchaseOrderDetailUsecase);

  final StreamController _purchasOrderStreamController = BehaviorSubject<PurchaseOrderDetailData>();

  @override
  void start() {}

  @override
  detail(String id) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _purchaseOrderDetailUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentState());
      inputPurchaseOrderDetail.add(data.data);
    });
  }

  @override
  Sink get inputPurchaseOrderDetail => _purchasOrderStreamController.sink;

  @override
  Stream<PurchaseOrderDetailData> get outputPurchaseOrderDetail =>
      _purchasOrderStreamController.stream.map((item) => item);
}

abstract class PurchaseOrderDetailViewmodelInputs {
  Sink get inputPurchaseOrderDetail;
  detail(String id);
}

abstract class PurchaseOrderDetailViewmodelOutputs {
  Stream<PurchaseOrderDetailData> get outputPurchaseOrderDetail;
}
