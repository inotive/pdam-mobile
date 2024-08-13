// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/domain/usecase/purchase_order/purchase_order_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class PurchaseOrderViewmodel extends BaseViewModel
    implements PurchaseOrderViewmodelInputs, PurchaseOrderViewmodelOutputs {
  final PurchaseOrderUsecase _purchaseOrderUsecase;
  PurchaseOrderViewmodel(this._purchaseOrderUsecase);

  final StreamController _purchasOrderStreamController = BehaviorSubject<List<PurchaseOrderDate>>();

  @override
  void start() {
    inputState.add(ContentWithoutDimissState());
    _purchaseOrder();
  }

  _purchaseOrder() async {
    // ignore: void_checks
    (await _purchaseOrderUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputPurchaseOrder.add(data.data);
    });
  }

  @override
  Sink get inputPurchaseOrder => _purchasOrderStreamController.sink;

  @override
  Stream<List<PurchaseOrderDate>> get outputPurchaseOrder => _purchasOrderStreamController.stream.map((item) => item);
}

abstract class PurchaseOrderViewmodelInputs {
  Sink get inputPurchaseOrder;
}

abstract class PurchaseOrderViewmodelOutputs {
  Stream<List<PurchaseOrderDate>> get outputPurchaseOrder;
}
