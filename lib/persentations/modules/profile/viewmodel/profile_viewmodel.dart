import 'dart:async';
import 'dart:ffi';

import 'package:pdam_inventory/domain/usecase/authentication/logout_usecase.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';

class ProfileViewModel extends BaseViewModel implements ProfileViewModelInputs, ProfileViewModelOutput {
  LogoutUsecase _logoutUsecase;

  ProfileViewModel(this._logoutUsecase);

  StreamController isUserLogoutSuccessfullyStreamController = StreamController<bool>();

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    isUserLogoutSuccessfullyStreamController.close();
  }

  @override
  logout() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    // ignore: void_checks
    (await _logoutUsecase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
    }, (data) {
      inputState.add(ContentState());
      isUserLogoutSuccessfullyStreamController.add(true);
    });
  }
}

abstract class ProfileViewModelInputs {
  logout();
}

abstract class ProfileViewModelOutput {}
