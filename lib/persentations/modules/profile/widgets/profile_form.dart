import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/persentations/modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final AppPreference _appPreference = instance<AppPreference>();
  final ProfileViewModel _profileViewModel = instance<ProfileViewModel>();

  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  setup() async {
    String name = await _appPreference.getString(PREFS_KEY_NAME);
    String email = await _appPreference.getString(PREFS_KEY_EMAIL);
    String username = await _appPreference.getString(PREFS_KEY_USERNAME);
    String role = await _appPreference.getString(PREFS_KEY_ROLE_NAME);
    String phone = await _appPreference.getString(PREFS_KEY_NO_TELP);

    _fullnameController = TextEditingController(text: name);
    _emailController = TextEditingController(text: email);
    _roleController = TextEditingController(text: role);
    _usernameController = TextEditingController(text: username);
    _phoneController = TextEditingController(text: phone);
    _profileViewModel.setName(name);
    _profileViewModel.setNoTelp(phone);

    _bind();
    setState(() {});
  }

  _bind() {
    _fullnameController.addListener(() => _profileViewModel.setName(_fullnameController.text));
    _phoneController.addListener(() => _profileViewModel.setNoTelp(_phoneController.text));
    _passwordController.addListener(() => _profileViewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    setup();
    // setup();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _profileViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () {}) ?? _getContentWidgets();
        });
  }

  Padding _getContentWidgets() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringApp.detailProfile,
            style: StyleApp.textNormal.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorApp.black,
            ),
          ),
          InputField(
            text: StringApp.fullname,
            hint: StringApp.fullname,
            controller: _fullnameController,
            padding: const EdgeInsets.only(top: 16.0),
          ),
          InputField(
            text: StringApp.email,
            hint: StringApp.email,
            controller: _emailController,
            padding: const EdgeInsets.only(top: 16.0),
            readOnly: true,
          ),
          InputField(
              text: StringApp.noContact,
              hint: StringApp.noContact,
              padding: const EdgeInsets.only(top: 16.0),
              controller: _phoneController),
          InputField(
            text: StringApp.role,
            hint: StringApp.role,
            controller: _roleController,
            padding: const EdgeInsets.only(top: 16.0),
            readOnly: true,
          ),
          InputField(
            text: StringApp.nameUser,
            hint: StringApp.nameUser,
            controller: _usernameController,
            padding: const EdgeInsets.only(top: 16.0),
            readOnly: true,
          ),
          InputField(
            text: StringApp.password,
            hint: StringApp.password,
            padding: const EdgeInsets.only(top: 16.0),
            controller: _passwordController,
          ),
          const SpacerHeight(16),
          CustomButton(
            text: StringApp.editData,
            backgroundColor: ColorApp.primary,
            onPressed: () {
              _profileViewModel.update();
            },
            height: 41,
          ),
        ],
      ),
    );
  }
}
