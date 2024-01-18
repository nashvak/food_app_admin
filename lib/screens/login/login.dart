import 'package:flutter/material.dart';
import 'package:food_app_admin/constants/app_colors.dart';
import 'package:food_app_admin/constants/app_styles.dart';
import 'package:food_app_admin/responsive_design/responsive.dart';
import 'package:food_app_admin/screens/login/widgets/login_button.dart';
import 'package:food_app_admin/screens/login/widgets/logo_container.dart';
import 'package:food_app_admin/screens/main_screen/main_screen.dart';
import 'package:food_app_admin/screens/signup/signup.dart';

import 'widgets/first_heading.dart';
import 'widgets/login_details_heading.dart';
import 'widgets/login_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isMobile(context)
                ? const SizedBox()
                : Expanded(
                    child: LoginLogoContainer(height: height),
                  ),
            // SizedBox(
            //   width: width * 0.1,
            // ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isMobile(context)
                        ? height * 0.032
                        : height * 0.12),
                color: white,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      const FirstHeading(
                        text: "Log In",
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      const LoginDetailsHeading(
                        text: 'Email',
                      ),
                      const SizedBox(height: 6.0),
                      LoginTextfield(
                        width: width,
                        text: 'Enter email',
                        icon: Icons.email,
                        obscure: false,
                      ),
                      SizedBox(height: height * 0.014),
                      const LoginDetailsHeading(
                        text: 'Password',
                      ),
                      const SizedBox(height: 6.0),
                      LoginTextfield(
                        width: width,
                        text: 'Enter Password',
                        icon: Icons.lock,
                        obscure: true,
                        suffix: const Icon(Icons.visibility_off),
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: appColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      LoginButton(
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          },
                          text: 'Log In'),
                      SizedBox(height: height * 0.05),
                      Row(
                        children: [
                          const Text('Dont have an account? '),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            child: const Text('Sign Up'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
