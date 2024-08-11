// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/domain/usecase/stock_opname/stock_opname_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:rxdart/rxdart.dart';

class StockOpnameViewmodel extends BaseViewModel implements StockOpnameViewmodelInputs, StockOpnameViewmodelOutputs {
  final StockOpnameUsecase _stockOpnameUsecase;
  StockOpnameViewmodel(this._stockOpnameUsecase);

  final StreamController _stockOpnameStreamController = BehaviorSubject<List<StockOpnameData>>();
  String date = EMPTY;
  @override
  void start() {
    inputState.add(ContentWithoutDimissState());
    _stockOpname();
  }

  @override
  void dispose() {
    _stockOpnameStreamController.close();
  }

  _stockOpname() async {
    Map<String, dynamic> queries = {
      'date': date,
    };

    (await _stockOpnameUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      date = EMPTY;
      inputState.add(ContentWithoutDimissState());
      inputStockOpname.add(data.data);
    });
  }

  @override
  setDate(String date) {
    this.date = date;
    _stockOpname();
  }

  @override
  Sink get inputStockOpname => _stockOpnameStreamController.sink;

  @override
  Stream<List<StockOpnameData>> get outputStockOpname => _stockOpnameStreamController.stream.map((item) => item);
}

abstract class StockOpnameViewmodelInputs {
  Sink get inputStockOpname;
  setDate(String date);
}

abstract class StockOpnameViewmodelOutputs {
  Stream<List<StockOpnameData>> get outputStockOpname;
}
