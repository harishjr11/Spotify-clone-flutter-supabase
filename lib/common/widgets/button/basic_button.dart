import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo/core/configs/assets/app_vectors.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  const BasicButton(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 80),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
      child: Text(title),
    );
  }
}

class BasicIconButton extends StatelessWidget {

  
  static const String basePath = 'assets/vectors/';
  static const String format = '.svg';

  final VoidCallback onPressed;
  final String title;
  final double? height;
  //= '${basePath}Sun$format';

  const BasicIconButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.height,});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Colors.white.withOpacity(0.25)),
      icon: SvgPicture.asset(AppVectors.sun),
      
    );
  }
}
