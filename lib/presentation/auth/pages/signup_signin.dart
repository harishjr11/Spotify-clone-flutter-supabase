import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:demo/common/helpers/is_dark_mode.dart';
import 'package:demo/common/widgets/appbar/app_bar.dart';
import 'package:demo/common/widgets/button/basic_button.dart';
import 'package:demo/core/configs/assets/app_vectors.dart';
import 'package:demo/core/configs/themes/app_colors.dart';
import 'package:demo/presentation/auth/pages/signin.dart';
import 'package:demo/presentation/auth/pages/signup.dart';
import 'package:demo/presentation/auth/pages/supa_signup.dart';
import 'package:demo/presentation/auth/pages/supa_signin.dart';

class SignUpOrSignin extends StatelessWidget {
  const SignUpOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BasicAppBar(),
        Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern)),
        Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern)),
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Enjoy listening to music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: context.isDarkMode
                          ? Colors.white
                          : AppColors.darkBackGround,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: context.isDarkMode
                          ? AppColors.grey
                          : AppColors.darkGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpPage()));
                            },
                            title: 'Register'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage()));
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
