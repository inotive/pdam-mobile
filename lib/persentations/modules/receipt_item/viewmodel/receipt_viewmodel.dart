import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/usecase/inputs/receive_order_input.dart';
import 'package:pdam_inventory/domain/usecase/products/product_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_create_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_warehouse_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/commons/freezed_data_classes.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class ReceiptViewmodel extends BaseViewModel implements ReceiptItemViewInputs, ReceiptItemViewOutputs {
  final ProductUsecase _productUsecase;
  final ReceiveOrderWarehouseUsecase _receiveOrderWarehouseUsecase;
  final ReceiveOrderCreateUsecase _receiveOrderCreateUsecase;
  ReceiptViewmodel(this._productUsecase, this._receiveOrderWarehouseUsecase, this._receiveOrderCreateUsecase);

  final StreamController _productStreamController = BehaviorSubject<List<ProductData>>();
  final StreamController _receiveOrderWarehouseStreamController = BehaviorSubject<List<ReceiveOrderWarehouseData>>();
  final StreamController isCreateSuccesfully = BehaviorSubject<bool>();

  ReceiveOrderObject _receiveOrderObject = ReceiveOrderObject(
    EMPTY,
    EMPTY,
    EMPTY,
    List.empty(),
  );

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
  create() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _receiveOrderCreateUsecase.execute(
      ReceiveOrderInput(
        _receiveOrderObject.refferenceNumber,
        _receiveOrderObject.warehouseId,
        _receiveOrderObject.note,
        _receiveOrderObject.productList,
      ),
    ))
        .fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentState());
      isCreateSuccesfully.add(true);
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

  @override
  setNote(String note) {
    _receiveOrderObject = _receiveOrderObject.copyWith(note: note);
  }

  @override
  setProductList(List<ReceiptProductParam> productList) {
    _receiveOrderObject = _receiveOrderObject.copyWith(productList: productList);
  }

  @override
  setRefferenceNumber(String refferenceNumber) {
    _receiveOrderObject = _receiveOrderObject.copyWith(refferenceNumber: refferenceNumber);
  }

  @override
  setWarehouseId(String warehouseId) {
    _receiveOrderObject = _receiveOrderObject.copyWith(warehouseId: warehouseId);
  }
}

abstract class ReceiptItemViewInputs {
  Sink get inputProduct;
  Sink get inputReceiveOrderWarehouse;
  create();
  setRefferenceNumber(String refferenceNumber);
  setWarehouseId(String warehouseId);
  setNote(String note);
  setProductList(List<ReceiptProductParam> productList);
}

abstract class ReceiptItemViewOutputs {
  Stream<List<ProductData>> get outputProduct;
  Stream<List<ReceiveOrderWarehouseData>> get outputReceiveOrderWarehouse;
}
