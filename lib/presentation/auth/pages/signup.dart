import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/basic_app_button.dart';
import '../../../core/configs/assets/app_image.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../../../data/auth/model/create_user_req.dart';
import '../../../domain/auth/usecase/signup_usecase.dart';
import '../../../service_loactor.dart';
import '../../home/pages/home_screen.dart';
import '../../layout/layout_screen.dart';

class SignUpPages extends StatefulWidget {
  const SignUpPages({super.key});

  @override
  State<SignUpPages> createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordvisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.2),
              radius: 18,
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ),
            ),
          ),
          title: SvgPicture.asset(
            AppVector.logo,
            height: 40,
            width: 40,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                _nameTextFeild(),
                const SizedBox(
                  height: 20,
                ),
                _emailTextFeild(),
                const SizedBox(
                  height: 20,
                ),
                _passwordTextFeild(),
                const SizedBox(
                  height: 30,
                ),
                basicAppButton(
                    onPressed: () async {
                      var result = await sl<SignupUsecase>().call(
                          params: CreateUserReq(
                              fullName: nameController.text,
                              email: emailController.text,
                              password: passwordController.text));
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
                              builder: (context) => const LayoutScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      );
                    },
                    title: 'Create Account'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 146,
                      height: 0.5,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Or'),
                    ),
                    Container(
                      width: 146,
                      height: 0.5,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppImage.google,
                        scale: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(AppImage.apple),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do You Have An Account?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const SignInPage(),
                        //     ));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }

  Widget _nameTextFeild() => TextField(
        controller: nameController,
        decoration: InputDecoration(
          label: const Text('Full Name'),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );

  Widget _emailTextFeild() => TextField(
        controller: emailController,
        decoration: const InputDecoration(hintText: 'Enter Email'),
      );

  Widget _passwordTextFeild() => TextField(
        controller: passwordController,
        decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordvisibility = !isPasswordvisibility;
                  });
                },
                icon: Icon(isPasswordvisibility
                    ? Icons.visibility
                    : Icons.visibility_off))),
        obscureText: !isPasswordvisibility,
      );
}
