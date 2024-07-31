import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/domain/model/notification_model.dart';
import 'package:pdam_inventory/domain/usecase/notification/notification_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

class NotificationViewmodel extends BaseViewModel implements NotificationViewmodelInputs, NotificationViewmodelOutputs {
  final NotificationUsecase _notificationUsecase;
  NotificationViewmodel(this._notificationUsecase);

  final StreamController _notificationStreamController = BehaviorSubject<List<NotificationData>>();

  @override
  void start() {
    inputState.add(ContentWithoutDimissState());
    _notifications();
  }

  @override
  void dispose() {
    _notificationStreamController.close();
  }

  _notifications() async {
    (await _notificationUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentWithoutDimissState());
      inputNotification.add(data.data);
    });
  }

  @override
  Sink get inputNotification => _notificationStreamController.sink;

  @override
  Stream<List<NotificationData>> get outputNotification => _notificationStreamController.stream.map((item) => item);
}

abstract class NotificationViewmodelInputs {
  Sink get inputNotification;
}

abstract class NotificationViewmodelOutputs {
  Stream<List<NotificationData>> get outputNotification;
}
