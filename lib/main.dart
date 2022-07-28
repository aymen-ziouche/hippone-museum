import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/screens/Annaba_page.dart';
import 'package:hippone_museum/screens/Events_page.dart';
import 'package:hippone_museum/screens/Pont_page.dart';
import 'package:hippone_museum/screens/Tarifs_page.dart';
import 'package:hippone_museum/screens/artworks_page.dart';
import 'package:hippone_museum/screens/carte_page.dart';
import 'package:hippone_museum/screens/forume_page.dart';
import 'package:hippone_museum/screens/gods_page.dart';
import 'package:hippone_museum/screens/history_page.dart';
import 'package:hippone_museum/screens/home_page.dart';
import 'package:hippone_museum/screens/info_page.dart';
import 'package:hippone_museum/screens/intro_slider.dart';
import 'package:hippone_museum/screens/mapscreen.dart';
import 'package:hippone_museum/screens/market_page.dart';
import 'package:hippone_museum/screens/quiz_page.dart';
import 'package:hippone_museum/screens/sculptures_page.dart';
import 'package:hippone_museum/screens/st_page.dart';
import 'package:hippone_museum/screens/visit.dart';

// void main() {
// runApp(const MyApp());
// }
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: OnBoarding.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        SculpturesPage.id: (context) => const SculpturesPage(),
        ArtworksPage.id: (context) => const ArtworksPage(),
        OnBoarding.id: (context) => OnBoarding(),
        MapScreen.id: (context) => const MapScreen(),
        CartePage.id: (context) => const CartePage(),
        InfoPage.id: (context) => const InfoPage(),
        VisitPage.id: (context) => const VisitPage(),
        GodsPage.id: (context) => const GodsPage(),
        EventsPage.id: (context) => const EventsPage(),
        QuizPage.id: (context) => const QuizPage(),
        TarifsPage.id: (context) => const TarifsPage(),
        ForumePage.id: (context) => const ForumePage(),
        MarketPage.id: (context) => const MarketPage(),
        HistoryPage.id: (context) => const HistoryPage(),
        AnnabaPage.id: (context) => const AnnabaPage(),
        PontPage.id: (context) => const PontPage(),
        SaintPage.id: (context) => const SaintPage(),
      },
    );
  }
}
