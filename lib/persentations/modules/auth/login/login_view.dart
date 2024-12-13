import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/persentations/modules/auth/login/viewmodel/login_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field_with_label.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final AppPreference _appPreference = instance<AppPreference>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  _bind() {
    _loginViewModel.start();
    _usernameController.addListener(() => _loginViewModel.setUserName(_usernameController.text));
    _passwordController.addListener(() => _loginViewModel.setPassword(_passwordController.text));
    _loginViewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((token) {
      // navigate to main screen
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _appPreference.setIsUserLoggedIn();
        resetModules();
        Navigator.of(context).pushReplacementNamed(Routes.mainMenu);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
                _loginViewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Stack _getContentWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorApp.primaryBgLinear1, ColorApp.primaryBgLinear2],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Image.asset(ImageApp.vector1),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Image.asset(ImageApp.vector2),
        ),
        _content(),
      ],
    );
  }

  Padding _content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              ImageApp.logoSplash,
              width: 38,
              height: 32,
            ),
          ),
          const SpacerHeight(24),
          Column(
            children: [
              Text(
                StringApp.login,
                style: StyleApp.text3xl.copyWith(
                  color: ColorApp.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SpacerHeight(8),
              Text(
                StringApp.loginDesc,
                style: StyleApp.textNormal.copyWith(
                  color: ColorApp.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SpacerHeight(40),
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  InputFieldWithLabel(
                    hint: StringApp.username,
                    label: StringApp.username,
                    controller: _usernameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return StringApp.nameUserValidation;
                      }
                      return null;
                    },
                  ),
                  const SpacerHeight(16),
                  InputFieldWithLabel(
                    hint: StringApp.password,
                    label: StringApp.password,
                    obscureText: obscureText,
                    controller: _passwordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return StringApp.passwordValidation;
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: ColorApp.grey99A,
                      ),
                    ),
                  ),
                  // const SpacerHeight(8),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Text(
                  //     "${StringApp.forgotPassword}?",
                  //     style: StyleApp.textSm.copyWith(
                  //       color: ColorApp.blue,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //     textAlign: TextAlign.right,
                  //   ),
                  // ),
                  const SpacerHeight(24),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _loginViewModel.login();
                      }
                    },
                    text: StringApp.login,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }
}
