import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/modules/Artwork.dart';
import 'package:hippone_museum/customwidgets/custom_sculpture_list_item.dart';
import 'package:hippone_museum/screens/details_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hippone_museum/services/be.dart';

class ArtworksPage extends StatefulWidget {
  const ArtworksPage({Key? key}) : super(key: key);
  static String id = "ArtworksPage";

  @override
  State<ArtworksPage> createState() => _ArtworksPageState();
}

class _ArtworksPageState extends State<ArtworksPage> {
  final _backend = BackEnd();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/inside2.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Artworks :",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: StreamBuilder<QuerySnapshot>(
                  stream: _backend.loadArtworks(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Artwork> _artworks = [];

                      for (var doc in snapshot.data!.docs) {
                        var data = doc;
                        _artworks.add(
                          Artwork(
                            description: data['Description'],
                            imageUrl: data['ImageUrl'],
                            name: data['Name'],
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  artwork: _artworks[index],
                                ),
                              ),
                            );
                          },
                          child: secondListItem(
                              _artworks[index].imageUrl,
                              _artworks[index].name,
                              _artworks[index].description),
                        ),
                        itemCount: _artworks.length,
                      );
                    } else {
                      return const Center(
                        child: Text("Loading..."),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
