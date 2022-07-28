import 'package:flutter/material.dart';

class TarifsPage extends StatelessWidget {
  const TarifsPage({Key? key}) : super(key: key);
  static String id = "TarifsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                height: 70,
              ),
              Text(
                "Le musée est ouvert tous les jours de 8h:00 du matin jusqu'a 18h:00 du soir",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                "Tarification : Acces Musée 130DA et l'acces au site 120DA , pour les étudiants et les agés demi prix et c'est gratuit pour les personnes handicapées et personnel militaire",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
