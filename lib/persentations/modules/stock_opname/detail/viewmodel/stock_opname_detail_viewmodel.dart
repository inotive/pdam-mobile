// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/domain/usecase/stock_opname/stock_opname_detail_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class StockOpnameDetailViewmodel extends BaseViewModel
    implements StockOpnameDetailViewmodelInputs, StockOpnameDetailViewmodelOutputs {
  final StockOpnameDetailUsecase _stockOpnameDetailUsecase;
  StockOpnameDetailViewmodel(this._stockOpnameDetailUsecase);

  final StreamController _detailStreamController = BehaviorSubject<StockOpnameDetailData>();

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  detail(String id) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _stockOpnameDetailUsecase.execute(id)).fold(
      (f) => inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, f.message)),
      (data) {
        inputState.add(ContentState());
        inputDetail.add(data.data);
      },
    );
  }

  @override
  Sink get inputDetail => _detailStreamController.sink;

  @override
  Stream<StockOpnameDetailData> get outputDetail => _detailStreamController.stream.map((item) => item);
}

abstract class StockOpnameDetailViewmodelInputs {
  Sink get inputDetail;
  detail(String id);
}

abstract class StockOpnameDetailViewmodelOutputs {
  Stream<StockOpnameDetailData> get outputDetail;
}
