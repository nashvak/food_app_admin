import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_admin/bloc/login/login_bloc.dart';
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
  LoginScreen({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  //  TabController tabController=TabController(length: 2,vsync: );
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
                        : height * 0.06),
                color: white,
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailed) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(state.error),
                      //     ),
                      //   );
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
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (route) => false);
                    }
                    // if (state is GotoSignupPageState) {
                    //   Navigator.pushAndRemoveUntil(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => SignupScreen(),
                    //       ),
                    //       (route) => false);
                    // }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is GotoSignupPageState) {
                      return SignupScreen();
                    }
                    return SingleChildScrollView(
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
                                context.read<LoginBloc>().add(
                                      LoginButtonPressed(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text),
                                    );
                              },
                              text: 'Log In'),
                          SizedBox(height: height * 0.05),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const WidgetSpan(
                                    child: SizedBox(
                                  width: 5,
                                )),
                                TextSpan(
                                  text: 'Register ',
                                  style: const TextStyle(color: appColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context
                                          .read<LoginBloc>()
                                          .add(GotoSignupPageButton());
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
