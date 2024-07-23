import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/usecase/products/product_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_warehouse_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class ReceiptViewmodel extends BaseViewModel implements ReceiptItemViewInputs, ReceiptItemViewOutputs {
  final ProductUsecase _productUsecase;
  final ReceiveOrderWarehouseUsecase _receiveOrderWarehouseUsecase;
  ReceiptViewmodel(this._productUsecase, this._receiveOrderWarehouseUsecase);

  final StreamController _productStreamController = BehaviorSubject<List<ProductData>>();
  final StreamController _receiveOrderWarehouseStreamController = BehaviorSubject<List<ReceiveOrderWarehouseData>>();

  @override
  void start() {
    _products();
    _warehouse();
  }

  _products() async {
    // ignore: void_checks
    (await _productUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputProduct.add(data.data);
    });
  }

  _warehouse() async {
    Map<String, dynamic> queries = {};
    (await _receiveOrderWarehouseUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputReceiveOrderWarehouse.add(data.data);
    });
  }

  @override
  Sink get inputProduct => _productStreamController.sink;

  @override
  Stream<List<ProductData>> get outputProduct => _productStreamController.stream.map((item) => item);

  @override
  Sink get inputReceiveOrderWarehouse => _receiveOrderWarehouseStreamController.sink;

  @override
  Stream<List<ReceiveOrderWarehouseData>> get outputReceiveOrderWarehouse =>
      _receiveOrderWarehouseStreamController.stream.map((item) => item);
}

abstract class ReceiptItemViewInputs {
  Sink get inputProduct;
  Sink get inputReceiveOrderWarehouse;
}

abstract class ReceiptItemViewOutputs {
  Stream<List<ProductData>> get outputProduct;
  Stream<List<ReceiveOrderWarehouseData>> get outputReceiveOrderWarehouse;
}
