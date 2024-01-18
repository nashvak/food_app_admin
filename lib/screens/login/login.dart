import 'package:flutter/material.dart';
import 'package:food_app_admin/constants/app_colors.dart';
import 'package:food_app_admin/constants/app_styles.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Expanded(
              child: Container(
                height: height,
                color: appColor,
                child: Center(
                  child: Text(
                    'Foodie',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   width: width * 0.1,
            // ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(horizontal: height * 0.20),
                color: white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.2),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Let's ",
                            style: ralewayStyle.copyWith(
                              fontSize: 25.0,
                              color: appColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign In 👇',
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              color: textColor,
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
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
                    Text(
                      'Email',
                      style: ralewayStyle.copyWith(
                        fontSize: 12.0,
                        color: appColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Container(
                      height: 50.0,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: white,
                      ),
                      child: TextFormField(
                        style: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: appColor,
                          fontSize: 12.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(top: 16.0),
                          hintText: 'Enter Email',
                          hintStyle: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: appColor.withOpacity(0.5),
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.014),
                    Text(
                      'Password',
                      style: ralewayStyle.copyWith(
                        fontSize: 12.0,
                        color: appColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Container(
                      height: 50.0,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: white,
                      ),
                      child: TextFormField(
                        style: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: appColor,
                          fontSize: 12.0,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.visibility_off,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(top: 16.0),
                          hintText: 'Enter Password',
                          hintStyle: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: appColor.withOpacity(0.5),
                            fontSize: 12.0,
                          ),
                        ),
                      ),
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
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(16.0),
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 18.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: appColor,
                          ),
                          child: Text(
                            'Sign In',
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
