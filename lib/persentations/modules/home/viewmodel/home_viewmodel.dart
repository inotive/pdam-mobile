import 'dart:ffi';

import 'package:pdam_inventory/domain/usecase/notification/notification_count_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';

class HomeViewmodel extends BaseViewModel implements HomeViewmodelInputs, HomeViewmodelOutputs {
  final NotificationCountUsecase _notificationCountUsecase;
  HomeViewmodel(this._notificationCountUsecase);

  @override
  void start() {
    inputState.add(ContentWithoutDimissState());
    _notificationCount();
  }

  _notificationCount() async {
    // ignore: void_checks
    (await _notificationCountUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
    });
  }
}

abstract class HomeViewmodelInputs {}

abstract class HomeViewmodelOutputs {}
