import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/core/app_color.dart';
import 'package:one_click_flowers/core/app_page.dart';
import 'package:one_click_flowers/src/view/screens/login_screen.dart';

import '../widgets/square_tile_widget.dart';
import '../widgets/mybutton_widget.dart';
import '../widgets/mytextfield_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    Get.offNamed(AppPage.oneClickFlowers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),

              // logo
              const Icon(
                Icons.app_registration_outlined,
                size: 100,
                color: AppColor.secondary,
              ),

              const SizedBox(height: 20),

              // welcome back, you've been missed!
              const Text(
                'Welcome to the best flower shop for you !',
                style: TextStyle(
                  color: AppColor.secondary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              MyTextFieldWidget(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextFieldWidget(
                controller: numberController,
                hintText: 'Phone Number',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // username textfield
              MyTextFieldWidget(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextFieldWidget(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextFieldWidget(
                controller: repeatPasswordController,
                hintText: 'Repeat Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),

              MyButtonWidget(
                onTap: signUserIn,
                title: "Register",
                icon: Icons.person_add_alt_1_rounded,
              ),
              // forgot password?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account ?',
                    style: TextStyle(color: AppColor.secondary),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                      onPressed: () {
                        Get.off(LoginScreen());
                      },
                      child: const Text("Login Now")),
                ],
              ),



              // or continue with
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Divider(
              //           thickness: 0.5,
              //           color: Colors.grey[400],
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //         child: Text(
              //           'Or continue with',
              //           style: TextStyle(color: Colors.grey[700]),
              //         ),
              //       ),
              //       Expanded(
              //         child: Divider(
              //           thickness: 0.5,
              //           color: Colors.grey[400],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 5),
              // // google + apple sign in buttons
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     // google button
              //     SquareTileWidget(
              //         imagePath: 'assets/image/logo/logo_google.png'),
              //
              //     SizedBox(width: 5),
              //
              //     // apple button
              //     SquareTileWidget(imagePath: 'assets/image/logo/logo_apple.png')
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
