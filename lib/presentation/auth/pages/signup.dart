import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:demo/common/widgets/appbar/app_bar.dart';
import 'package:demo/common/widgets/button/basic_button.dart';
import 'package:demo/core/configs/assets/app_vectors.dart';
import 'package:demo/core/configs/themes/app_colors.dart';
import 'package:demo/data/models/auth/create_user_req.dart';
import 'package:demo/domain/usecases/auth/signup.dart';
import 'package:demo/navigations/tabbar.dart';
import 'package:demo/presentation/auth/pages/signin.dart';
import 'package:demo/service_locator.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(height: 40, width: 40, AppVectors.logo),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              _loginsupportText(context),
              const SizedBox(
                height: 20,
              ),
              _fullNameFeild(context),
              const SizedBox(
                height: 20,
              ),
              _emailFeild(context),
              const SizedBox(
                height: 20,
              ),
              _passwordFeild(context),
              const SizedBox(
                height: 30,
              ),
              BasicButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                      params: CreateUserReq(
                        fullName: _fullName.text.toString(),
                        email: _email.text.toString(),
                        password: _password.text.toString(),
                      ),
                    );
                    result.fold(
                      (l){
                        var snackbar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      (r){
                        Navigator.pushAndRemoveUntil(
                          context, 
                          MaterialPageRoute(
                            builder: (BuildContext context) => const Tabbar()),
                          (route) => false 
                          );
                      }
                      );
                  },
                  title: 'Create account'),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SvgPicture.asset(
                        AppVectors.leftLine,
                        height: 5,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SvgPicture.asset(
                        AppVectors.or,
                        height: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SvgPicture.asset(
                        AppVectors.rightLine,
                        height: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _loginsupportText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'If you need any help',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Signup(),
              ),
            );
          },
          child: const Text(
            'Click here',
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.primary),
          ),
        )
      ],
    );
  }

  Widget _fullNameFeild(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(hintText: 'Full Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailFeild(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordFeild(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Signin(),
                ),
              );
            },
            child: const Text(
              'Sign in',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
          )
        ],
      ),
    );
  }
}
