import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/core/app_color.dart';
import 'package:one_click_flowers/core/app_page.dart';
import 'package:one_click_flowers/src/controller/splash_controller.dart';
import 'package:one_click_flowers/src/view/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/square_tile_widget.dart';
import '../widgets/mybutton_widget.dart';
import '../widgets/mytextfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async{
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(SplashController.KEYLOGIN, true);
    Get.offNamed(AppPage.oneClickFlowers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),

            // logo
            const Icon(
              Icons.lock_rounded,
              size: 100,
              color: AppColor.secondary,
            ),

            const SizedBox(height: 20),

            // welcome back, you've been missed!
            const Text(
              'Welcome back you\'ve been missed!',
              style: TextStyle(
                color: AppColor.secondary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

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

            const SizedBox(height: 20),

            // forgot password?
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Text(
            //         'Forgot Password?',
            //         style: TextStyle(color: AppColor.secondary),
            //       ),
            //     ],
            //   ),
            // ),


            // sign in button
            MyButtonWidget(
              onTap: signUserIn,
              title: "Sign In",
              icon: Icons.login,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not a member?',
                  style: TextStyle(color: AppColor.secondary),
                ),
                const SizedBox(width: 4),
                TextButton(onPressed: (){
                  Get.off(RegisterScreen());
                }, child: const Text("Register Now")),
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
            //     SquareTileWidget(imagePath: 'assets/image/logo/logo_google.png'),
            //
            //     SizedBox(width: 5),
            //
            //     // apple button
            //     SquareTileWidget(imagePath: 'assets/image/logo/logo_apple.png')
            //   ],
            // ),
            //
            // const SizedBox(height: 5),

            // not a member? register now

          ],
        ),
      ),
    );
  }
}