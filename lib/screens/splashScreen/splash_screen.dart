import 'package:flutter/material.dart';
import 'package:grimorio/helper/route_transitions.dart';
import 'package:grimorio/screens/dashboard.dart';
import 'package:grimorio/config/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    showAnimation();
    super.initState();
  }

  Future<void> showAnimation() async {
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() => opacity = 1);
    await Future.delayed(const Duration(milliseconds: 2900));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      sliderRouteTransition(
        begin: const Offset(1, 0),
        nextPage: const Dashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.modalBackgroundGradient[2],
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/images/grimorio_1152.png',
                height: 300,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: opacity,
              curve: Curves.easeIn,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  'assets/images/grimorio_titulo_1152.png',
                  height: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
