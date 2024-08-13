// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:pdam_inventory/data/params/request_product_param.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/usecase/inputs/request_item_input.dart';
import 'package:pdam_inventory/domain/usecase/products/product_by_warehouse_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request/create_purchase_request_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/commons/freezed_data_classes.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:rxdart/rxdart.dart';

class CreateRequestItemViewmodel extends BaseViewModel
    implements CreateRequestItemViewmodelInputs, CreateRequestItemViewmodelOutputs {
  final CreatePurchaseRequestUsecase _createPurchaseRequestUsecase;
  final ProductByWarehouseUsecase _productByWarehouseUsecase;
  CreateRequestItemViewmodel(this._createPurchaseRequestUsecase, this._productByWarehouseUsecase);

  final StreamController _productStreamController = BehaviorSubject<List<PurchaseRequestProduct>>();
  final StreamController isCreateSuccesfully = StreamController<bool>();
  CreatePurchaseRequestObject _createPurchaseRequestObject =
      CreatePurchaseRequestObject(EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, List.empty());

  @override
  void start() {}

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
    (await _createPurchaseRequestUsecase.execute(RequestItemInput(
      _createPurchaseRequestObject.requestNumber,
      _createPurchaseRequestObject.departmentName,
      _createPurchaseRequestObject.requestDate,
      _createPurchaseRequestObject.requestName,
      _createPurchaseRequestObject.requestDescription,
      _createPurchaseRequestObject.productList,
    )))
        .fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(SuccessState(StringApp.requestedItemSuccess));
      isCreateSuccesfully.add(true);
    });
  }

  @override
  setDepartmentName(String departmentName) {
    _createPurchaseRequestObject = _createPurchaseRequestObject.copyWith(departmentName: departmentName);
  }

  @override
  setProductList(List<RequestProductParam> products) {
    _createPurchaseRequestObject = _createPurchaseRequestObject.copyWith(productList: products);
  }

  @override
  setRequestDate(String requestDate) {
    _createPurchaseRequestObject = _createPurchaseRequestObject.copyWith(requestDate: requestDate);
  }

  @override
  setRequestDescription(String requestDescription) {
    _createPurchaseRequestObject = _createPurchaseRequestObject.copyWith(requestDescription: requestDescription);
  }

  @override
  setRequestName(String requestName) {
    _createPurchaseRequestObject = _createPurchaseRequestObject.copyWith(requestName: requestName);
  }

  @override
  setRequestNumber(String requestNumber) {
    _createPurchaseRequestObject = _createPurchaseRequestObject.copyWith(requestNumber: requestNumber);
  }

  @override
  Sink get inputProduct => _productStreamController.sink;

  @override
  Stream<List<PurchaseRequestProduct>> get outputProduct => _productStreamController.stream.map((item) => item);
}

abstract class CreateRequestItemViewmodelInputs {
  Sink get inputProduct;

  create();
  products(int warehouseId);

  setRequestNumber(String requestNumber);
  setRequestDate(String requestDate);
  setDepartmentName(String departmentName);
  setRequestName(String requestName);
  setRequestDescription(String requestDescription);
  setProductList(List<RequestProductParam> products);
}

abstract class CreateRequestItemViewmodelOutputs {
  Stream<List<PurchaseRequestProduct>> get outputProduct;
}
