import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/persentations/modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/profile/widgets/profile_card.dart';
import 'package:pdam_inventory/persentations/modules/profile/widgets/profile_form.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileViewModel _profileViewModel = instance<ProfileViewModel>();

  _bind() {
    _profileViewModel.start();
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
      body: SafeArea(
        child: ListView(
          children: [
            const ProfileCard(),
            const ProfileForm(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: CustomOutlineButton(
                onPressed: () {
                  // _appPreference.removeString(PREFS_KEY_TOKEN);
                  // _appPreference.removeString(PREFS_KEY_IS_USER_LOGGED_IN);
                  // _appPreference.removeString(PREFS_KEY_NAME);
                  _profileViewModel.logout();
                  // Navigator.pushReplacementNamed(context, Routes.login);
                },
                text: StringApp.logout,
                textColor: ColorApp.red,
                borderColor: ColorApp.red,
                backgroundColor: ColorApp.redBg,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _profileViewModel.dispose();
    super.dispose();
  }
}
