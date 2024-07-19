// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/usecase/products/product_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_summary_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class ProductViewmodel extends BaseViewModel implements ProductViewmodelInputs, ProductViewmodelOutputs {
  final ProductUsecase _productUsecase;
  final ProductSummaryUsecase _productSummaryUsecase;
  final ProductDetailUsecase _productDetailUsecase;
  ProductViewmodel(this._productDetailUsecase, this._productUsecase, this._productSummaryUsecase);

  final StreamController _productStreamController = BehaviorSubject<List<ProductData>>();
  final StreamController _productSearchStreamController = BehaviorSubject<List<ProductData>>();
  final StreamController _productDetailStreamController = BehaviorSubject<ProductDetailData>();
  final StreamController _productSummaryStreamController = BehaviorSubject<ProductSummaryData>();
  @override
  void start() {
    inputState.add(ContentWithoutDimissState());
    _products();
    _productSummary();
  }

  _products() async {
    // ignore: void_checks
    (await _productUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputProducts.add(data.data);
    });
  }

  _productSummary() async {
    // ignore: void_checks
    (await _productSummaryUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputProductSummary.add(data.data);
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
  search(String query) async {
    // ignore: void_checks
    (await _productUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      _productSearchStreamController.add(
        data.data.where((item) => item.name.toString().toLowerCase().contains(query.toLowerCase())).toList(),
      );
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

  @override
  Sink get inputProductsSearch => _productSearchStreamController.sink;

  @override
  Stream<List<ProductData>> get outputProductsSearch => _productSearchStreamController.stream.map((search) => search);

  @override
  Sink get inputProductSummary => _productSummaryStreamController.sink;

  @override
  Stream<ProductSummaryData> get outputProductSummary => _productSummaryStreamController.stream.map((item) => item);
}

abstract class ProductViewmodelInputs {
  search(String query);

  Sink get inputProducts;
  Sink get inputProductsSearch;
  Sink get inputProductDetail;
  Sink get inputProductSummary;
}

abstract class ProductViewmodelOutputs {
  Stream<List<ProductData>> get outputProducts;
  Stream<List<ProductData>> get outputProductsSearch;
  Stream<ProductDetailData> get outputProductDetail;
  Stream<ProductSummaryData> get outputProductSummary;
}
