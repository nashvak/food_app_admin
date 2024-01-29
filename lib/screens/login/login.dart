import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_admin/constants/app_colors.dart';
import 'package:food_app_admin/constants/app_styles.dart';
import 'package:food_app_admin/responsive_design/responsive.dart';
import 'package:food_app_admin/screens/login/widgets/login_button.dart';
import 'package:food_app_admin/screens/login/widgets/logo_container.dart';
import 'package:food_app_admin/screens/main_screen/main_screen.dart';

import '../../models/user_login_model.dart';
import 'login/login_bloc.dart';
import 'widgets/first_heading.dart';
import 'widgets/login_details_heading.dart';
import 'widgets/login_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

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
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailed) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // <-- SEE HERE
                        title: const Text('Error'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(state.error),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                if (state is LoginSuccess) {
                  if (state.user.id == 15) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  } else {}
                }
                // if (state is GotoSignupPageState) {
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: (context) => SignupScreen()));
                // }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Expanded(
                  child: Container(
                    height: height,
                    margin: EdgeInsets.symmetric(
                        horizontal: ResponsiveWidget.isMobile(context)
                            ? height * 0.032
                            : height * 0.06),
                    // color: Colors.yellow,
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
                            controller: emailcontroller,
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
                            controller: passwordcontroller,
                            width: width,
                            text: 'Enter Password',
                            icon: Icons.lock,
                            obscure: true,
                            suffix: const Icon(Icons.visibility_off),
                          ),
                          SizedBox(height: height * 0.03),
                          SizedBox(
                            height: 50.0,
                            width: ResponsiveWidget.isMobile(context)
                                ? width
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.4
                                    : width * 0.3,
                            child: Align(
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
                          ),
                          SizedBox(height: height * 0.05),
                          LoginButton(
                              ontap: () {
                                context.read<LoginBloc>().add(
                                      LoginButtonPressed(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text),
                                    );
                              },
                              text: 'Log In'),
                          SizedBox(height: height * 0.05),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
