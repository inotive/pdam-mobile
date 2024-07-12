import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class RequestedViewModel extends BaseViewModel implements RequestedViewModelInputs, RequestedViewModelOutputs {
  final PurchaseRequestUsecase _purchaseRequestUsecase;
  RequestedViewModel(this._purchaseRequestUsecase);

  final _purchaseRequestStreamController = BehaviorSubject<List<PurchaseRequestDate>>();

  Map<String, dynamic> queries = {};

  @override
  void start() {
    _loadData();
  }

  @override
  void dispose() {
    _purchaseRequestStreamController.close();
    super.dispose();
  }

  _loadData() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _purchaseRequestUsecase.execute(queries)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) async {
      inputState.add(ContentState());
      inputPurchaseRequest.add(data.data);
    });
  }

  @override
  Sink get inputPurchaseRequest => _purchaseRequestStreamController.sink;

  @override
  Stream<List<PurchaseRequestDate>> get outputPurchaseRequest =>
      _purchaseRequestStreamController.stream.map((purchase) => purchase);
}

abstract class RequestedViewModelInputs {
  Sink get inputPurchaseRequest;
}

abstract class RequestedViewModelOutputs {
  Stream<List<PurchaseRequestDate>> get outputPurchaseRequest;
}
