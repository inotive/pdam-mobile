import 'dart:async';

import 'package:pdam_inventory/data/params/stock_opname_product_param.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/usecase/inputs/stock_opname_input.dart';
import 'package:pdam_inventory/domain/usecase/products/product_by_warehouse_usecase.dart';
import 'package:pdam_inventory/domain/usecase/stock_opname/stock_opname_create_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/commons/freezed_data_classes.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

import '../../../../packages/state_renderer/state_renderer.dart';

class CreateStockOpnameViewmodel extends BaseViewModel
    implements CreateStockOpnameViewmodelInputs, CreateStockOpnameViewmodelOutputs {
  final StockOpnameCreateUsecase _stockOpnameCreateUsecase;
  final ProductByWarehouseUsecase _productByWarehouseUsecase;
  CreateStockOpnameViewmodel(this._stockOpnameCreateUsecase, this._productByWarehouseUsecase);

  final StreamController _productStreamController = BehaviorSubject<List<PurchaseRequestProduct>>();
  final StreamController isCreateSuccesfully = StreamController<bool>();

  CreateStockOpnameObject _stockOpnameObject = CreateStockOpnameObject(EMPTY, EMPTY, EMPTY, EMPTY, List.empty());

  @override
  void start() {
    // TODO: implement start
  }

  @override
  products(int warehouseId) async {
    // ignore: void_checks
    (await _productByWarehouseUsecase.execute(warehouseId)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());

      inputProduct.add(data.data);
    });
  }

  @override
  create() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _stockOpnameCreateUsecase.execute(StockOpnameInput(
      _stockOpnameObject.warehouseId,
      _stockOpnameObject.opnameNumber,
      _stockOpnameObject.date,
      _stockOpnameObject.description,
      _stockOpnameObject.products,
    )))
        .fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(SuccessState(StringApp.requestedItemSuccess));
      isCreateSuccesfully.add(true);
    });
  }

  @override
  setDate(String date) {
    _stockOpnameObject = _stockOpnameObject.copyWith(date: date);
  }

  @override
  setDescription(String description) {
    _stockOpnameObject = _stockOpnameObject.copyWith(description: description);
  }

  @override
  setOpnameNumber(String opnameNumber) {
    _stockOpnameObject = _stockOpnameObject.copyWith(opnameNumber: opnameNumber);
  }

  @override
  setProducts(List<StockOpnameProductParam> products) {
    _stockOpnameObject = _stockOpnameObject.copyWith(products: products);
  }

  @override
  setWarehouseId(String warehouseId) {
    _stockOpnameObject = _stockOpnameObject.copyWith(warehouseId: warehouseId);
  }

  @override
  Sink get inputProduct => _productStreamController.sink;

  @override
  Stream<List<PurchaseRequestProduct>> get outputProduct => _productStreamController.stream.map((item) => item);
}

abstract class CreateStockOpnameViewmodelInputs {
  products(int warehouseId);
  create();

  setWarehouseId(String warehouseId);
  setDate(String date);
  setDescription(String description);
  setOpnameNumber(String opnameNumber);
  setProducts(List<StockOpnameProductParam> products);

  Sink get inputProduct;
}

abstract class CreateStockOpnameViewmodelOutputs {
  Stream<List<PurchaseRequestProduct>> get outputProduct;
}
