import 'package:flutter/material.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/utils/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColors.black,
      body: Center(
        child: Image.asset(NetflixIcons.netflix),
      ),
    );
  }
}
