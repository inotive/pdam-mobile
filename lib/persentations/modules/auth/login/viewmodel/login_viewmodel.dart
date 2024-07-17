import 'dart:async';

import 'package:pdam_inventory/domain/usecase/authentication/login_usecase.dart';
import 'package:pdam_inventory/domain/usecase/inputs/login_input.dart';
import 'package:pdam_inventory/persentations/base/base_viewmodel.dart';
import 'package:pdam_inventory/persentations/commons/freezed_data_classes.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel implements LoginViewModelInputs, LoginViewModelOutputs {
  LoginUsecase _loginUsecase;

  LoginViewModel(this._loginUsecase);

  StreamController _usernameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();

  StreamController _isAllInputsValidStreamController = StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController = StreamController<String>();

  LoginObject _loginObject = LoginObject('', '');

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _usernameStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  login() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _loginUsecase.execute(LoginInput(_loginObject.username, _loginObject.password))).fold((failure) {
      // left -> failure
      inputState.add(ErrorState(StateRendererType.SNACKBAR_ERROR_STATE, failure.message));
      Future.delayed(const Duration(seconds: 3), () {
        inputState.add(ContentState());
      });
    }, (data) {
      // right -> success (data)
      inputState.add(ContentState());

      // navigate to main screen after the login
      isUserLoggedInSuccessfullyStreamController.add("abcdefgh");
    });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    _loginObject = _loginObject.copyWith(password: password); // data class operation same as kotlin
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUsername.add(userName);
    _loginObject = _loginObject.copyWith(username: userName); // data class operation same as kotlin
    _validate();
  }

  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid =>
      _usernameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid => _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(_loginObject.password) && _isUserNameValid(_loginObject.username);
  }
}

abstract class LoginViewModelInputs {
  // three functions for actions
  setUserName(String username);

  setPassword(String password);

  login();

// two sinks for streams
  Sink get inputUsername;

  Sink get inputPassword;

  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
