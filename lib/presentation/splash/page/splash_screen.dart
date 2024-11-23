import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../../intro/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    move();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVector.logo),
      ),
    );
  }

  Future<void> move() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GetStarted(),
        ));
  }
}
