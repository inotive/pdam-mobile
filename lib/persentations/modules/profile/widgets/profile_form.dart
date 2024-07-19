import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
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
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  setup() async {
    String name = await _appPreference.getString(PREFS_KEY_NAME);
    String email = await _appPreference.getString(PREFS_KEY_EMAIL);
    String username = await _appPreference.getString(PREFS_KEY_USERNAME);
    String role = await _appPreference.getString(PREFS_KEY_ROLE_NAME);

    _fullnameController = TextEditingController(text: name);
    _emailController = TextEditingController(text: email);
    _roleController = TextEditingController(text: role);
    _usernameController = TextEditingController(text: username);

    setState(() {});
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          const InputField(
            text: StringApp.noContact,
            hint: StringApp.noContact,
            padding: EdgeInsets.only(top: 16.0),
          ),
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
          const InputField(
            text: StringApp.password,
            hint: StringApp.password,
            padding: EdgeInsets.only(top: 16.0),
          ),
          const SpacerHeight(16),
          CustomButton(
            text: StringApp.editData,
            backgroundColor: ColorApp.primary,
            onPressed: () {},
            height: 41,
          ),
        ],
      ),
    );
  }
}
