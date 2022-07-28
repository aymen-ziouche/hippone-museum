import 'package:flutter/material.dart';

class CartePage extends StatefulWidget {
  const CartePage({Key? key}) : super(key: key);
  static String id = "CartePage";

  @override
  State<CartePage> createState() => _CartePageState();
}

class _CartePageState extends State<CartePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Carte du site'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Carte de site",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "THIS WILL BE THE FULL MAP OF THE MUSEUM",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/hippone-museum-ee5b4.appspot.com/o/carteSite.PNG?alt=media&token=93119844-7df6-4c07-b3e1-0a425fb1cc96",
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            "THIS WILL BE ANOTHER REALLY LONG TEXT",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
