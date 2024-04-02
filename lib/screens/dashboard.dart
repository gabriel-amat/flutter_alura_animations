import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/screens/login.dart';
import 'package:grimorio/shared/components/carousel_item.dart';
import 'package:grimorio/shared/components/primary_button.dart';
import 'package:grimorio/config/theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SvgPicture.asset("assets/images/background.svg"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // SvgPicture.asset("assets/images/logo.svg"),
                      CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 500,
                          aspectRatio: 1,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayCurve: Curves.easeInBack,
                          scrollDirection: Axis.vertical,
                        ),
                        items: const [
                          CarouselItem(
                            imagePath: "carousel-001.png",
                            text: "Registre seus livros",
                          ),
                          CarouselItem(
                            imagePath: "carousel-002.png",
                            text: "Faça anotações",
                          ),
                          CarouselItem(
                            imagePath: "carousel-003.png",
                            text: "Visualize seu progresso",
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 104.0),
                        child: PrimaryButton(
                          text: "Entrar",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
