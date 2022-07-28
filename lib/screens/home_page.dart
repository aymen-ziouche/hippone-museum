import 'package:flutter/material.dart';
import 'package:hippone_museum/customwidgets/custom_listItem.dart';
import 'package:hippone_museum/screens/Annaba_page.dart';
import 'package:hippone_museum/screens/Events_page.dart';
import 'package:hippone_museum/screens/Pont_page.dart';
import 'package:hippone_museum/screens/Tarifs_page.dart';
import 'package:hippone_museum/screens/artworks_page.dart';
import 'package:hippone_museum/screens/carte_page.dart';
import 'package:hippone_museum/screens/details_page.dart';
import 'package:hippone_museum/screens/forume_page.dart';
import 'package:hippone_museum/screens/gods_page.dart';
import 'package:hippone_museum/screens/history_page.dart';
import 'package:hippone_museum/screens/info_page.dart';
import 'package:hippone_museum/screens/mapscreen.dart';
import 'package:hippone_museum/screens/market_page.dart';
import 'package:hippone_museum/screens/quiz_page.dart';
import 'package:hippone_museum/screens/sculptures_page.dart';
import 'package:hippone_museum/screens/st_page.dart';
import 'package:hippone_museum/screens/visit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        onTap: (value) {
          switch (value) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(context, CartePage.id);
              break;
            case 2:
              Navigator.pushNamed(context, MapScreen.id);
              break;
            case 3:
              final Future<XFile?> _photo =
                  _picker.pickImage(source: ImageSource.camera);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
            activeIcon: Icon(Icons.home, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.map),
            label: "Carte site",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.mapLocationDot),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.qrcode),
            label: "QR Code",
            backgroundColor: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.black38,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.circleInfo),
            onPressed: () {
              Navigator.pushNamed(context, InfoPage.id);
            },
          ),
        ],
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hippone Museum'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, AnnabaPage.id);
              },
              child:
                  listItem("assets/histoire de annba.jpg", "Histoir de Bône")),
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, HistoryPage.id);
              },
              child: listItem("assets/museum.jpg", "histoire du Musée")),
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, GodsPage.id);
              },
              child: listItem("assets/dieux2.jpg", "Les Dieux Romains")),
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, ArtworksPage.id);
              },
              child: listItem("assets/inside2.jpg", "inside the Museum")),
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, VisitPage.id);
              },
              child: listItem("assets/vrr.jpg", "Visite virtuelle")),
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, PontPage.id);
              },
              child: listItem(
                  "assets/background pont.JPG", "Pont Romain Séraidi")),
          const SizedBox(height: 10),
          InkWell(
              onDoubleTap: () {},
              onTap: () {
                Navigator.pushNamed(context, SaintPage.id);
              },
              child: listItem("assets/st1.jpg", "histoire du ST augustin")),
          const SizedBox(height: 10),
          InkWell(
            onLongPress: () {},
            onTap: () {
              Navigator.pushNamed(context, ForumePage.id);
            },
            child: listItem("assets/hippo2.PNG", "Le Forume"),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onLongPress: () {},
            onTap: () {
              Navigator.pushNamed(context, MarketPage.id);
            },
            child: listItem("assets/Marche.PNG", "Le Marché d'Hippone"),
          ),
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, EventsPage.id);
              },
              child: listItem("assets/events.jpeg", "Événement à venir")),
          const SizedBox(height: 10),
          InkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.pushNamed(context, QuizPage.id);
              },
              child: listItem("assets/quiz.jpg", "Quiz")),
          const SizedBox(height: 10),
          InkWell(
            onLongPress: () {},
            onTap: () {
              Navigator.pushNamed(context, TarifsPage.id);
            },
            child:
                listItem("assets/tarifs.jpeg", "Horraires de Travail / Tarifs"),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
