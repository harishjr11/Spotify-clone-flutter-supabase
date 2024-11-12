import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo/core/configs/assets/app_vectors.dart';
import 'package:demo/navigations/tabbar.dart';
import 'package:demo/presentation/intro/pages/get_started.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      ),
    );
  }


 void redirect() async {
  await Future.delayed(const Duration(seconds: 2));

    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      // Navigate to home screen if user is already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Tabbar()),
      );
    } else {
      // Navigate to login screen if not logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStartedPage()),
      );
    }
  }



}
