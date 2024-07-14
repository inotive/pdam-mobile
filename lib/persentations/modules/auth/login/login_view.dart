import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/persentations/modules/auth/login/viewmodel/login_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
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
  bool obscureText = false;

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

  ListView _getContentWidget() {
    return ListView(
      children: [
        _header(),
        const SpacerHeight(32),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: [
                InputField(
                  hint: StringApp.username,
                  label: StringApp.nameUser,
                  controller: _usernameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return StringApp.nameUserValidation;
                    }
                    return null;
                  },
                ),
                const SpacerHeight(16),
                InputField(
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
                      color: ColorApp.border,
                    ),
                  ),
                ),
                const SpacerHeight(32),
                CustomButton(
                  text: StringApp.login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _loginViewModel.login();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _header() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      decoration: const BoxDecoration(
        color: ColorApp.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${StringApp.welcomeBack},",
            style: StyleApp.textLg.copyWith(
              color: ColorApp.white,
            ),
          ),
          const SpacerHeight(4),
          Text(
            StringApp.pdamInventoryApp,
            style: StyleApp.text2xl.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorApp.white,
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
