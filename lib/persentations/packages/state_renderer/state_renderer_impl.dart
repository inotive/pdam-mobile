import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message}) : message = message ?? StringApp.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// error state (POPUP, FULL LOADING)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// CONTENT STATE
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => EMPTY;

  @override
  StateRendererType getStateRendererType() => StateRendererType.CONTENT_SCREEN_STATE;
}

// EMPTY STATE
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.EMPTY_SCREEN_STATE;
}

// success state
class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.SNACKBAR_SUCCESS_STATE;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget, Function retryActionFunction) {
    switch (runtimeType) {
      case const (LoadingState):
        {
          if (getStateRendererType() == StateRendererType.POPUP_LOADING_STATE) {
            // showing popup dialog
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showPopUp(context, getStateRendererType(), getMessage());
            });
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_LOADING_STATE
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case const (ErrorState):
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.POPUP_ERROR_STATE) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage());
            // return the content ui of the screen
            return contentScreenWidget;
          } else if (getStateRendererType() == StateRendererType.SNACKBAR_ERROR_STATE) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // HelpersApp.topSnackbarError(getMessage(), context);
              context.showFlash<bool>(
                barrierDismissible: true,
                duration: const Duration(seconds: 3),
                builder: (context, controller) => FlashBar(
                  controller: controller,
                  position: FlashPosition.top,
                  backgroundColor: ColorApp.red,
                  content: Text(
                    getMessage().toString(),
                    style: StyleApp.textNormal.copyWith(
                      color: ColorApp.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  elevation: 0,
                ),
              );
            });
            return contentScreenWidget;
          } else {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case const (ContentState):
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case const (EmptyState):
        {
          return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      case const (SuccessState):
        {
          dismissDialog(context);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.showFlash<bool>(
              barrierDismissible: true,
              duration: const Duration(seconds: 3),
              builder: (context, controller) => FlashBar(
                controller: controller,
                position: FlashPosition.top,
                backgroundColor: ColorApp.green,
                content: Text(
                  getMessage().toString(),
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                elevation: 0,
              ),
            );
          });
          // return content ui of the screen
          return contentScreenWidget;
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;

  showPopUp(BuildContext context, StateRendererType stateRendererType, String message, {String title = EMPTY}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              title: title,
              retryActionFunction: () {},
            )));
  }
}
