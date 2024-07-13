import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_detail_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class RequestedDetailViewModel extends BaseViewModel
    implements RequestedDetailViewModelInputs, RequestedDetailViewModelOutputs {
  final PurchaseRequestDetailUsecase _purchaseRequestDetailUsecase;
  RequestedDetailViewModel(
    this._purchaseRequestDetailUsecase,
  );

  final _purchaseRequestDetailStreamController = BehaviorSubject<PurchaseRequestDetailData>();

  @override
  void start() async {
    // inputState.add(ContentState());
  }

  @override
  void dispose() {
    // _purchaseRequestDetailStreamController.close();
  }

  detail(int id) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _purchaseRequestDetailUsecase.execute(id)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) async {
      inputState.add(ContentState());
      inputPurchaseDetailRequest.add(data.data);
    });
  }

  @override
  Sink get inputPurchaseDetailRequest => _purchaseRequestDetailStreamController.sink;

  @override
  Stream<PurchaseRequestDetailData> get outputPurchaseDetailRequest =>
      _purchaseRequestDetailStreamController.stream.map((detail) => detail);
}

abstract class RequestedDetailViewModelInputs {
  Sink get inputPurchaseDetailRequest;
}

abstract class RequestedDetailViewModelOutputs {
  Stream<PurchaseRequestDetailData> get outputPurchaseDetailRequest;
}
