import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/main.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  _SplashScreensState createState() {
    return _SplashScreensState();
  }
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500)).then((value) => {Modular.to.navigate(homeRouterName)});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF101010)),
        child: Stack(
          children: [
            Positioned(
              left: 478.03,
              top: 217.32,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(2.88),
                child: Container(
                  width: 579.35,
                  height: 380.27,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00, 1.00),
                      end: Alignment(0, -1),
                      colors: [Color(0xFF0E7023), Color(0x000E7024)],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -157.71,
              top: 631.31,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-0.52),
                child: Container(
                  width: 704.69,
                  height: 477.69,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00, 1.00),
                      end: Alignment(0, -1),
                      colors: [Color(0xFF0E7023), Color(0x000E7024)],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 115,
              top: 401,
              child: Container(
                width: 162,
                height: 50,
                clipBehavior: Clip.none,
                decoration: const BoxDecoration(),
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  width: 162,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
