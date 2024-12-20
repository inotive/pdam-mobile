import 'dart:ffi';

import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_summary_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class RequestedViewModel extends BaseViewModel implements RequestedViewModelInputs, RequestedViewModelOutputs {
  final PurchaseRequestUsecase _purchaseRequestUsecase;
  final PurchaseRequestSummaryUsecase _purchaseRequestSummaryUsecase;
  RequestedViewModel(this._purchaseRequestUsecase, this._purchaseRequestSummaryUsecase);

  final _purchaseRequestStreamController = BehaviorSubject<List<PurchaseRequestDate>>();
  final _purchaseRequestSummaryStreamController = BehaviorSubject<PurchaseRequestSummaryData>();

  Map<String, dynamic> queries = {};

  @override
  void start() async {
    inputState.add(ContentState());
    _loadSummary();
    _loadData();
  }

  // @override
  // void dispose() {
  //   if (!_purchaseRequestStreamController.isClosed) _purchaseRequestStreamController.close();
  //   if (!_purchaseRequestSummaryStreamController.isClosed) _purchaseRequestSummaryStreamController.close();
  // }

  _loadData() async {
    (await _purchaseRequestUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) async {
      inputState.add(ContentState());
      inputPurchaseRequest.add(data.data);
    });
  }

  _loadSummary() async {
    // ignore: void_checks
    (await _purchaseRequestSummaryUsecase.execute(Void)).fold((failure) {
      // inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) async {
      // inputState.add(ContentState());
      inputPurchaseSummaryRequest.add(data.data);
    });
  }

  @override
  search(String query) async {
    Map<String, dynamic> q = {
      'q': query,
    };

    (await _purchaseRequestUsecase.execute(q)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) async {
      inputState.add(ContentState());
      inputPurchaseRequest.add(data.data);
    });
  }

  @override
  Sink get inputPurchaseRequest => _purchaseRequestStreamController.sink;

  @override
  Sink get inputPurchaseSummaryRequest => _purchaseRequestSummaryStreamController.sink;

  @override
  Stream<List<PurchaseRequestDate>> get outputPurchaseRequest =>
      _purchaseRequestStreamController.stream.map((purchase) => purchase);

  @override
  Stream<PurchaseRequestSummaryData> get outputPurchaseSummaryRequest =>
      _purchaseRequestSummaryStreamController.stream.map((summary) => summary);
}

abstract class RequestedViewModelInputs {
  Sink get inputPurchaseRequest;
  Sink get inputPurchaseSummaryRequest;
  search(String query);
}

abstract class RequestedViewModelOutputs {
  Stream<List<PurchaseRequestDate>> get outputPurchaseRequest;
  Stream<PurchaseRequestSummaryData> get outputPurchaseSummaryRequest;
}
