import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo/common/widgets/button/basic_button.dart';
import 'package:demo/core/configs/assets/app_vectors.dart';
import 'package:demo/core/configs/themes/app_colors.dart';
import 'package:demo/presentation/auth/pages/signup_signin.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Enjoy listening to Music',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Discover a world of music tailored just for you. Just hit 'Get Started' to dive into playlists crafted for every moment. Your music journey awaits..",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                BasicButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SignUpOrSignin(),
                      ),
                    );
                  },
                  title: 'Get Started',
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
