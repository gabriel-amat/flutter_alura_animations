import 'package:flutter/material.dart';

Route sliderRouteTransition({
  required Widget nextPage,
  Duration duration = const Duration(milliseconds: 1500),
  Curve curves = Curves.ease,
  Offset begin =  const Offset(-1, 1),
}) {
  return PageRouteBuilder(
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      Animatable<Offset> tween = Tween(
        begin: begin,
        end: Offset.zero,
      ).chain(
        CurveTween(curve: curves),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: nextPage,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return nextPage;
    },
  );
}
