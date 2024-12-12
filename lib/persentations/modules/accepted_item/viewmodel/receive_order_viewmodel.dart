import 'dart:async';

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
  final StreamController _searchReceiveOrderStreamController = BehaviorSubject<List<ReceiveOrderDate>>();

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
    (await _receiveOrderUsecase.execute({})).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (result) {
      inputState.add(ContentWithoutDimissState());
      inputReceiveOrder.add(result.data);
    });
  }

  @override
  search(String query) async {
    Map<String, dynamic> queries = {
      'q': query,
    };
    // ignore: void_checks
    (await _receiveOrderUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputSearch.add(data.data);
    });
  }

  @override
  Sink get inputReceiveOrder => _receiveOrderStreamController.sink;

  @override
  Stream<List<ReceiveOrderDate>> get outputReceiveOrder => _receiveOrderStreamController.stream.map((item) => item);

  @override
  Sink get inputSearch => _searchReceiveOrderStreamController.sink;

  @override
  Stream<List<ReceiveOrderDate>> get outputSearch => _searchReceiveOrderStreamController.stream.map((item) => item);
}

abstract class ReceiveOrderViewmodelInputs {
  Sink get inputReceiveOrder;
  Sink get inputSearch;
  search(String query);
}

abstract class ReceiveOrderViewmodelOutputs {
  Stream<List<ReceiveOrderDate>> get outputReceiveOrder;
  Stream<List<ReceiveOrderDate>> get outputSearch;
}
