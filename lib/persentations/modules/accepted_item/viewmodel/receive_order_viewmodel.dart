import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class ReceiveOrderViewmodel extends BaseViewModel implements ReceiveOrderViewmodelInputs, ReceiveOrderViewmodelOutputs {
  final ReceiveOrderUsecase _receiveOrderUsecase;
  ReceiveOrderViewmodel(this._receiveOrderUsecase);

  final StreamController _receiveOrderStreamController = BehaviorSubject<List<ReceiveOrderDate>>();

  @override
  void start() async {
    inputState.add(ContentWithoutDimissState());
    _receiveOrder();
  }

  @override
  dispose() {
    _receiveOrderStreamController.close();
  }

  _receiveOrder() async {
    // ignore: void_checks
    (await _receiveOrderUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (result) {
      inputState.add(ContentWithoutDimissState());
      inputReceiveOrder.add(result.data);
    });
  }

  @override
  Sink get inputReceiveOrder => _receiveOrderStreamController.sink;

  @override
  Stream<List<ReceiveOrderDate>> get outputReceiveOrder => _receiveOrderStreamController.stream.map((item) => item);
}

abstract class ReceiveOrderViewmodelInputs {
  Sink get inputReceiveOrder;
}

abstract class ReceiveOrderViewmodelOutputs {
  Stream<List<ReceiveOrderDate>> get outputReceiveOrder;
}
