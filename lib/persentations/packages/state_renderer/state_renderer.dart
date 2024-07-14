// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';

enum StateRendererType {
  // POPUP STATES
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  POPUP_SUCCESS,

  SNACKBAR_ERROR_STATE,
  SNACKBAR_SUCCESS_STATE,

  // FULL SCREEN STATES
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE, // THE UI OF THE SCREEN
  CONTENT_WITHOUT_DISMISS_SCREEN_STATE, // THE UI OF THE SCREEN
  EMPTY_SCREEN_STATE // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API SIDE FOR LIST SCREEN
}

class StateRenderer extends StatelessWidget {
  StateRenderer({
    super.key,
    required this.stateRendererType,
    String? message,
    String? title,
    required this.retryActionFunction,
  })  : message = message ?? StringApp.loading,
        title = title ?? EMPTY;

  StateRendererType stateRendererType;
  String title;
  String message;
  Function? retryActionFunction;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getLoadingDialog();
      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(
          context,
          [
            _getAnimatedImage(AnimationApp.error),
            _getMessage(title),
            _getMessage(message),
            _getRetryButton(StringApp.ok, context),
          ],
        );
      case StateRendererType.SNACKBAR_ERROR_STATE:
        return Container();
      case StateRendererType.SNACKBAR_SUCCESS_STATE:
        return Container();
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return Container(
          decoration: const BoxDecoration(
            color: ColorApp.white,
          ),
          child: _getItemsInColumn(
            [
              _getAnimatedImage(AnimationApp.error),
              _getMessage(message),
              _getRetryButton(StringApp.retryAgain, context),
            ],
          ),
        );
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();
      case StateRendererType.CONTENT_WITHOUT_DISMISS_SCREEN_STATE:
        return Container();
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColumn([_getMessage(message)]);

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Text(
          message,
          style: StyleApp.textLg,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _getRetryButton(String title, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          onPressed: () {
            if (stateRendererType == StateRendererType.FULL_SCREEN_ERROR_STATE) {
              retryActionFunction?.call();
            } else {
              Navigator.of(context).pop();
            }
          },
          text: title,
        ),
      ),
    );
  }

  Widget _getAnimatedImage(String asset) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Lottie.asset(asset),
    );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _getLoadingDialog() {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: SizedBox(
        width: 70,
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: SpinKitFadingCircle(
                color: ColorApp.primary,
                size: 42,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
