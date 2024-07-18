// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_detail_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class ReceiveOrderDetailViewmodel extends BaseViewModel
    implements ReceiveOrderDetailViewmodelInputs, ReceiveOrderDetailViewmodelOutputs {
  final ReceiveOrderDetailUsecase _receiveOrderDetailUsecase;
  ReceiveOrderDetailViewmodel(this._receiveOrderDetailUsecase);

  final StreamController _receiveOrderDetailStreamController = BehaviorSubject<ReceiveOrderDetailData>();

  @override
  void start() {}

  @override
  receiveOrderDetail(int id) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _receiveOrderDetailUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentState());
      inputReceiveOrderDetail.add(data.data);
    });
  }

  @override
  void dispose() {
    _receiveOrderDetailStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputReceiveOrderDetail => _receiveOrderDetailStreamController.sink;

  @override
  Stream<ReceiveOrderDetailData> get outputReceiveOrderDetail =>
      _receiveOrderDetailStreamController.stream.map((item) => item);
}

abstract class ReceiveOrderDetailViewmodelInputs {
  Sink get inputReceiveOrderDetail;
  receiveOrderDetail(int id);
}

abstract class ReceiveOrderDetailViewmodelOutputs {
  Stream<ReceiveOrderDetailData> get outputReceiveOrderDetail;
}
