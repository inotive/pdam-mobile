import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _header(),
          const SpacerHeight(32),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                children: [
                  const InputField(
                    hint: StringApp.username,
                    label: StringApp.nameUser,
                  ),
                  const SpacerHeight(16),
                  InputField(
                    hint: StringApp.password,
                    label: StringApp.password,
                    obscureText: obscureText,
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
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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
}
