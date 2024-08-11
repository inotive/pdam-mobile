import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/model/vendor_model.dart';
import 'package:pdam_inventory/domain/usecase/inputs/receive_order_input.dart';
import 'package:pdam_inventory/domain/usecase/products/product_by_warehouse_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_create_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_reference_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_reference_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_supplier_usecase.dart';
import 'package:pdam_inventory/domain/usecase/vendor/vendor_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/commons/freezed_data_classes.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class ReceiptViewmodel extends BaseViewModel implements ReceiptItemViewInputs, ReceiptItemViewOutputs {
  final ProductByWarehouseUsecase _productByWarehouseUsecase;
  final ReceiveOrderCreateUsecase _receiveOrderCreateUsecase;
  final ReceiveOrderReferenceUsecase _receiveOrderReferenceUsecase;
  final ReceiveOrderReferenceDetailUsecase _receiveOrderReferenceDetailUsecase;
  final ReceiveOrderSupplierUsecase _receiveOrderSupplierUsecase;
  final VendorUsecase _vendorUsecase;
  ReceiptViewmodel(
    this._productByWarehouseUsecase,
    this._receiveOrderCreateUsecase,
    this._receiveOrderReferenceUsecase,
    this._receiveOrderReferenceDetailUsecase,
    this._receiveOrderSupplierUsecase,
    this._vendorUsecase,
  );

  final StreamController _productStreamController = BehaviorSubject<List<PurchaseRequestProduct>>();
  final StreamController _receiveOrderReferenceStreamController = BehaviorSubject<List<PurchaseRequest>>();
  final StreamController _receiveOrderReferenceDetailStreamController = BehaviorSubject<PurchaseRequestDetailData>();
  final StreamController _receiveOrderReferenceSupplierStreamController =
      BehaviorSubject<List<ReceiveOrderSupplierData>>();
  final StreamController _vendorStreamController = BehaviorSubject<List<VendorDataModel>>();
  final StreamController isCreateSuccesfully = BehaviorSubject<bool>();
  List<PurchaseRequestProduct> refProducts = [];
  List<ReceiptProductParam> refProductsParams = [];

  ReceiveOrderObject _receiveOrderObject = ReceiveOrderObject(
    EMPTY,
    EMPTY,
    EMPTY,
    EMPTY,
    File(EMPTY),
    List.empty(),
  );

  @override
  void start() {
    _reference();
    _supplier();
    _vendor();
  }

  @override
  dispose() {
    _receiveOrderReferenceDetailStreamController.close();
    _receiveOrderReferenceStreamController.close();
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

  _reference() async {
    Map<String, dynamic> queries = {};
    (await _receiveOrderReferenceUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputReference.add(data.data);
    });
  }

  _supplier() async {
    Map<String, dynamic> queries = {};
    (await _receiveOrderSupplierUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputSupplier.add(data.data);
    });
  }

  _vendor() async {
    Map<String, dynamic> queries = {};
    (await _vendorUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputVendor.add(data.data);
    });
  }

  @override
  create(BuildContext context) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _receiveOrderCreateUsecase.execute(
      ReceiveOrderInput(
        _receiveOrderObject.refferenceNumber,
        _receiveOrderObject.supplierId,
        _receiveOrderObject.warehouseId,
        _receiveOrderObject.note,
        _receiveOrderObject.file,
        _receiveOrderObject.productList,
      ),
    ))
        .fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      SnackbarApp.topSnackbarSucces('Terima Barang berhasil disimpan', context);
      Navigator.pushReplacementNamed(context, Routes.acceptedItem);
    });
    // inputState.add(ContentState());
    // isCreateSuccesfully.add(true);
  }

  @override
  referenceDetail(int id) async {
    (await _receiveOrderReferenceDetailUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputReferenceDetail.add(data.data);
      refProducts = data.data?.products ?? List.empty();
      refProductsParams =
          data.data?.products.map((item) => ReceiptProductParam(item.id, int.parse(item.qty))).toList() ?? List.empty();
    });
  }

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

  @override
  setFile(File file) {
    _receiveOrderObject = _receiveOrderObject.copyWith(file: file);
  }

  @override
  setSupplierId(String supplierId) {
    _receiveOrderObject = _receiveOrderObject.copyWith(supplierId: supplierId);
  }

  @override
  Sink get inputProduct => _productStreamController.sink;

  @override
  Stream<List<PurchaseRequestProduct>> get outputProduct => _productStreamController.stream.map((item) => item);

  @override
  Sink get inputReference => _receiveOrderReferenceStreamController.sink;

  @override
  Stream<List<PurchaseRequest>> get outputReference =>
      _receiveOrderReferenceStreamController.stream.map((item) => item);

  @override
  Sink get inputReferenceDetail => _receiveOrderReferenceDetailStreamController.sink;

  @override
  Stream<PurchaseRequestDetailData> get outputReferenceDetail =>
      _receiveOrderReferenceDetailStreamController.stream.map((item) => item);

  @override
  Sink get inputSupplier => _receiveOrderReferenceSupplierStreamController.sink;

  @override
  Stream<List<ReceiveOrderSupplierData>> get outputSupplier =>
      _receiveOrderReferenceSupplierStreamController.stream.map((sup) => sup);

  @override
  Sink get inputVendor => _vendorStreamController.sink;

  @override
  Stream<List<VendorDataModel>> get outputVendor => _vendorStreamController.stream.map((item) => item);
}

abstract class ReceiptItemViewInputs {
  Sink get inputProduct;
  Sink get inputReference;
  Sink get inputReferenceDetail;
  Sink get inputSupplier;
  Sink get inputVendor;
  create(BuildContext context);
  referenceDetail(int id);
  products(int warehouseId);
  setRefferenceNumber(String refferenceNumber);
  setWarehouseId(String warehouseId);
  setSupplierId(String supplierId);
  setNote(String note);
  setFile(File file);
  setProductList(List<ReceiptProductParam> productList);
}

abstract class ReceiptItemViewOutputs {
  Stream<List<PurchaseRequestProduct>> get outputProduct;
  Stream<List<PurchaseRequest>> get outputReference;
  Stream<PurchaseRequestDetailData> get outputReferenceDetail;
  Stream<List<ReceiveOrderSupplierData>> get outputSupplier;
  Stream<List<VendorDataModel>> get outputVendor;
}
