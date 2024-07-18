import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/persentations/modules/home/widgets/header_home_card.dart';
import 'package:pdam_inventory/persentations/modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AppPreference _appPreference = instance<AppPreference>();
  final ProfileViewModel _profileViewModel = instance<ProfileViewModel>();

  String _name = EMPTY;

  _bind() {
    _profileViewModel.start();
    _appPreference.getString(PREFS_KEY_NAME).then((name) {
      setState(() {
        _name = name;
      });
    });
    _profileViewModel.isUserLogoutSuccessfullyStreamController.stream.listen((isLogout) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        resetModules();
        SnackbarApp.topSnackbarSucces('Anda Telah Keluar', context);
        Navigator.of(context).pushReplacementNamed(Routes.login);
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
      body: ListView(
        children: [
          HeaderHomeCard(name: _name),
          const SpacerHeight(32),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              onPressed: () {
                // _appPreference.removeString(PREFS_KEY_TOKEN);
                // _appPreference.removeString(PREFS_KEY_IS_USER_LOGGED_IN);
                // _appPreference.removeString(PREFS_KEY_NAME);
                _profileViewModel.logout();
                // Navigator.pushReplacementNamed(context, Routes.login);
              },
              text: StringApp.logout,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _profileViewModel.dispose();
    super.dispose();
  }
}
