// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/usecase/products/product_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class ProductViewmodel extends BaseViewModel implements ProductViewmodelInputs, ProductViewmodelOutputs {
  final ProductUsecase _productUsecase;
  final ProductDetailUsecase _productDetailUsecase;
  ProductViewmodel(this._productDetailUsecase, this._productUsecase);

  final StreamController _productStreamController = BehaviorSubject<List<ProductData>>();
  final StreamController _productDetailStreamController = BehaviorSubject<ProductDetailData>();

  @override
  void start() {
    inputState.add(ContentWithoutDimissState());
    _products();
  }

  _products() async {
    // ignore: void_checks
    (await _productUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      _productStreamController.add(data.data);
    });
  }

  productDetail(int id) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    // ignore: void_checks
    (await _productDetailUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentState());
      _productDetailStreamController.add(data.data);
    });
  }

  @override
  Sink get inputProducts => _productStreamController.sink;

  @override
  Stream<List<ProductData>> get outputProducts => _productStreamController.stream.map((product) => product);

  @override
  Sink get inputProductDetail => _productDetailStreamController.sink;

  @override
  Stream<ProductDetailData> get outputProductDetail => _productDetailStreamController.stream.map((detail) => detail);
}

abstract class ProductViewmodelInputs {
  Sink get inputProducts;
  Sink get inputProductDetail;
}

abstract class ProductViewmodelOutputs {
  Stream<List<ProductData>> get outputProducts;
  Stream<ProductDetailData> get outputProductDetail;
}
