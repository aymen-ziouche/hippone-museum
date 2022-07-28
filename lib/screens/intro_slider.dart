import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:hippone_museum/screens/home_page.dart';

class OnBoarding extends StatelessWidget {
  static String id = "OnBoarding";
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: Colors.black,
      finishButtonText: 'Take a tour',
      finishButtonColor: Colors.white10,
      onFinish: () {
        Navigator.pushReplacementNamed(context, HomePage.id);
      },
      background: [
        Container(
          color: Colors.black,
          height: 700,
          width: 800,
        ),
        Container(
          color: Colors.black,
          height: 700,
          width: 800,
        ),
        Container(
          color: Colors.black,
          height: 700,
          width: 800,
        ),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Hippone Museum',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 120),
            Container(
              width: 350,
              child: const Text(
                "Le site antique d'Hippone qui est presque méconnu de nos citoyens, et qui est l'un des plus important et plus anciens sites de l'Afrique du Nord ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 230),
            Container(
              width: 350,
              child: const Text(
                "Entre amis ou en famille, un guide vous accompagnera tout au long de la visite",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Cette Application incorpore la fonctionalitè du QR Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            Container(height: 90, child: Image.asset("assets/scan3.png")),
            SizedBox(height: 40),
            Container(
              width: 350,
              child: const Text(
                "Vous pouvez donc vous en servir pour acceder rapidement aux diffèrentes oeuvres contenus dans l'application",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Dirigez votre objectif vers l'oeuvre( vous trouverez un QR Code, scannez-le)..et voilà ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 120),
            Container(height: 160, child: Image.asset("assets/scan4.jpg")),
            SizedBox(height: 100),
            Container(
              width: 350,
              child: const Text(
                "l'image s'ouvre et vous pouvez alors l'explorer comme jamais auparavant",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ],
    );
  }
}
