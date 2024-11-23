import 'package:flutter/material.dart';
import 'package:spoti_third/common/helper/is_dark_mode.dart';
import 'package:spoti_third/core/configs/theme/app_color.dart';
import 'package:spoti_third/domain/auth/usecase/signout_usecase.dart';
import 'package:spoti_third/presentation/auth/pages/signin.dart';
import 'package:spoti_third/presentation/splash/page/splash_screen.dart';
import 'package:spoti_third/service_loactor.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _profileInfo(context),
          Spacer(),
          _signOut(context),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 2.7,
        decoration: BoxDecoration(
          color: context.isDarkMode ? AppColor.darkGrey : Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(80),
            bottomLeft: Radius.circular(80),
          ),
        ),
      );

  Widget _signOut(BuildContext context) => TextButton(
      onPressed: () async {
        var result = await sl<SignoutUsecase>().call();
        result.fold(
          (l) {
            var snackBar = SnackBar(
              content: Text(l),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          (r) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              ),
              (route) => false,
            );
          },
        );
      },
      child: Text('Sign Out'));
}
