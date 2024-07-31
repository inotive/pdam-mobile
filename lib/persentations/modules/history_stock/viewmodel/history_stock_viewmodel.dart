import 'dart:async';

import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/domain/usecase/history_stock/history_stock_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class HistoryStockViewmodel extends BaseViewModel implements HistoryStockViewmodelInputs, HistoryStockViewmodelOutputs {
  final HistoryStockUsecase _historyStockUsecase;

  HistoryStockViewmodel(this._historyStockUsecase);

  final StreamController _allHistoryStockStreamController = BehaviorSubject<List<HistoryStockData>>();
  final StreamController _searchStreamController = BehaviorSubject<List<HistoryStockData>>();
  final StreamController _inHistoryStockStreamController = BehaviorSubject<List<HistoryStockData>>();
  final StreamController _outHistoryStockStreamController = BehaviorSubject<List<HistoryStockData>>();

  @override
  void start() {
    _historyStock();
  }

  _historyStock() async {
    Map<String, dynamic> queries = {};
    // ignore: void_checks
    (await _historyStockUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputAllHistoryStock.add(data.data);
      inputInHistoryStock.add(data.data.where((item) => item.type == "Masuk").toList());
      inputOutHistoryStock.add(data.data.where((item) => item.type == "Keluar").toList());
    });
  }

  @override
  search(String query) async {
    Map<String, dynamic> queries = {};
    // ignore: void_checks
    (await _historyStockUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputSearch.add(data.data);
    });
  }

  @override
  Sink get inputAllHistoryStock => _allHistoryStockStreamController.sink;

  @override
  Sink get inputInHistoryStock => _inHistoryStockStreamController.sink;

  @override
  Sink get inputOutHistoryStock => _outHistoryStockStreamController.sink;

  @override
  Stream<List<HistoryStockData>> get outputAllHistoryStock =>
      _allHistoryStockStreamController.stream.map((item) => item);

  @override
  Stream<List<HistoryStockData>> get outputInHistoryStock => _inHistoryStockStreamController.stream.map((item) => item);

  @override
  Stream<List<HistoryStockData>> get outputOutHistoryStock =>
      _outHistoryStockStreamController.stream.map((item) => item);

  @override
  Sink get inputSearch => _searchStreamController.sink;

  @override
  Stream<List<HistoryStockData>> get outputSearch => _searchStreamController.stream.map((item) => item);
}

abstract class HistoryStockViewmodelInputs {
  search(String query);
  Sink get inputAllHistoryStock;
  Sink get inputSearch;
  Sink get inputInHistoryStock;
  Sink get inputOutHistoryStock;
}

abstract class HistoryStockViewmodelOutputs {
  Stream<List<HistoryStockData>> get outputAllHistoryStock;
  Stream<List<HistoryStockData>> get outputSearch;
  Stream<List<HistoryStockData>> get outputInHistoryStock;
  Stream<List<HistoryStockData>> get outputOutHistoryStock;
}
