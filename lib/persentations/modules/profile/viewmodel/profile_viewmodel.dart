import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:pdam_inventory/domain/usecase/authentication/logout_usecase.dart';
import 'package:pdam_inventory/domain/usecase/authentication/update_user_usecase.dart';
import 'package:pdam_inventory/domain/usecase/inputs/update_user_input.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/commons/freezed_data_classes.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class ProfileViewModel extends BaseViewModel implements ProfileViewModelInputs, ProfileViewModelOutput {
  final LogoutUsecase _logoutUsecase;
  final UpdateUserUsecase _updateUserUsecase;

  ProfileViewModel(this._logoutUsecase, this._updateUserUsecase);

  StreamController isUserLogoutSuccessfullyStreamController = StreamController<bool>();

  UpdateUserObject _updateUserObject = UpdateUserObject(EMPTY, EMPTY, EMPTY, File(EMPTY));

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

  @override
  setName(String name) {
    _updateUserObject = _updateUserObject.copyWith(name: name);
  }

  @override
  setNoTelp(String noTelp) {
    _updateUserObject = _updateUserObject.copyWith(noTelp: noTelp);
  }

  @override
  setPassword(String password) {
    _updateUserObject = _updateUserObject.copyWith(password: password);
  }

  @override
  update() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _updateUserUsecase.execute(
      UpdateUserInput(
        _updateUserObject.name,
        _updateUserObject.password,
        _updateUserObject.noTelp,
        _updateUserObject.file,
      ),
    ))
        .fold((error) {
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, error.message));
    }, (data) {
      inputState.add(SuccessState('Update profil berhasil!'));
    });
  }
}

abstract class ProfileViewModelInputs {
  logout();
  update();
  setName(String name);
  setPassword(String password);
  setNoTelp(String noTelp);
}

abstract class ProfileViewModelOutput {}
