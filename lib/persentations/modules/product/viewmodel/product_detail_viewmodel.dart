// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/usecase/products/product_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_stock_history_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_warehouse_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailViewmodel extends BaseViewModel
    implements ProductDetailViewmodelInputs, ProductDetailViewmodelOutputs {
  final ProductDetailUsecase _productDetailUsecase;
  final ProductWarehouseUsecase _productWarehouseUsecase;
  final ProductStockHistoryUsecase _productStockHistoryUsecase;
  ProductDetailViewmodel(this._productDetailUsecase, this._productWarehouseUsecase, this._productStockHistoryUsecase);

  final StreamController _productDetailStreamController = BehaviorSubject<ProductDetailData>();
  final StreamController _productWarehouseStreamController = BehaviorSubject<List<ProductWarehouseData>>();
  final StreamController _productStockHistoryStreamController = BehaviorSubject<List<ProductStockHistoryData>>();

  @override
  void start() {
    inputState.add(ContentWithoutDimissState());
  }

  productDetail(String id) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    // ignore: void_checks
    (await _productDetailUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentState());
      _productDetailStreamController.add(data.data);
    });
  }

  productWarehouse(String id) async {
    (await _productWarehouseUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputProductWarehouse.add(data.data);
    });
  }

  productStockHistory(String id) async {
    (await _productStockHistoryUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentState());
      inputProductStockHistory.add(data.data);
    });
  }

  @override
  Sink get inputProductDetail => _productDetailStreamController.sink;

  @override
  Stream<ProductDetailData> get outputProductDetail => _productDetailStreamController.stream.map((detail) => detail);

  @override
  Sink get inputProductWarehouse => _productWarehouseStreamController.sink;

  @override
  Stream<List<ProductWarehouseData>> get outputProductWarehouse =>
      _productWarehouseStreamController.stream.map((item) => item);

  @override
  Sink get inputProductStockHistory => _productStockHistoryStreamController.sink;

  @override
  Stream<List<ProductStockHistoryData>> get outputProductStockHistory =>
      _productStockHistoryStreamController.stream.map((item) => item);
}

abstract class ProductDetailViewmodelInputs {
  Sink get inputProductDetail;
  Sink get inputProductWarehouse;
  Sink get inputProductStockHistory;
}

abstract class ProductDetailViewmodelOutputs {
  Stream<ProductDetailData> get outputProductDetail;
  Stream<List<ProductWarehouseData>> get outputProductWarehouse;
  Stream<List<ProductStockHistoryData>> get outputProductStockHistory;
}
