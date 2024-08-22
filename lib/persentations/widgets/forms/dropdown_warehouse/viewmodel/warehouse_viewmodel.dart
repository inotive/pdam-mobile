// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_warehouse_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class WarehouseViewmodel extends BaseViewModel implements WarehouseViewmodelInputs, WarehouseViewmodelOutputs {
  final ReceiveOrderWarehouseUsecase _receiveOrderWarehouseUsecase;
  WarehouseViewmodel(this._receiveOrderWarehouseUsecase);

  final StreamController _warehouseStreamController = BehaviorSubject<List<ReceiveOrderWarehouseData>>();

  @override
  void start() {
    _warehouse();
  }

  _warehouse() async {
    Map<String, dynamic> queries = {
      'limit': 50,
    };
    (await _receiveOrderWarehouseUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputWarehouse.add(data.data);
    });
  }

  @override
  Sink get inputWarehouse => _warehouseStreamController.sink;

  @override
  Stream<List<ReceiveOrderWarehouseData>> get outputWarehouse => _warehouseStreamController.stream.map((item) => item);
}

abstract class WarehouseViewmodelInputs {
  Sink get inputWarehouse;
}

abstract class WarehouseViewmodelOutputs {
  Stream<List<ReceiveOrderWarehouseData>> get outputWarehouse;
}
