import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VisitPage extends StatelessWidget {
  const VisitPage({Key? key}) : super(key: key);
  static String id = "VisitPage";

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "La visite virtuelle est en cours de rèalisation, notre equipe de developpeurs veille sur ca",
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
            Text(
              "Cependant, vous pouvez visiter notre site qui vous offre une immersion vituelle 360 avec un contenu multumédia riche",
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: InkWell(
                onTap: () {
                  _launchUrl();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Click Here",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _launchUrl() async {
  final Uri _url = Uri.parse(
      'https://www.vrdz360.com/VR/Hippone/?fbclid=IwAR2paDXPz0SlcW8rwVtfg4LuPg23cQ2sSP8DdB6m7sR0nTDjgMhr92lrmmA');
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
