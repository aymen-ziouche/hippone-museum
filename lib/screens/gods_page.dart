import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/customwidgets/custom_sculpture_list_item.dart';
import 'package:hippone_museum/modules/Gods.dart';
import 'package:hippone_museum/services/be.dart';

class GodsPage extends StatefulWidget {
  const GodsPage({Key? key}) : super(key: key);
  static String id = "GodsPage";

  @override
  State<GodsPage> createState() => _GodsPageState();
}

class _GodsPageState extends State<GodsPage> {
  final _backend = BackEnd();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference objects =
      FirebaseFirestore.instance.collection('Objects');

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
              "assets/dieux2.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Column(
                children: const [
                  Text(
                    "Mythologie Romaine",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "La mythologie romaine est en une grande partie inspiré de la mythologie grecque qui, elle est plus ancienne. Les dieux romains sont donc souvent les memes que les dieux grecs, sauf que leurs ,om change et parfois aussi certaines fonctions et attributs",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: _backend.LoadGods(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Gods> _gods = [];

                    for (var doc in snapshot.data!.docs) {
                      var data = doc;
                      _gods.add(
                        Gods(
                          description: data['Description'] ?? "Desc",
                          imageUrl: data['ImageUrl'] ?? "",
                          name: data['Name'] ?? "Some Name",
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        child: secondListItem(_gods[index].imageUrl,
                            _gods[index].name, _gods[index].description),
                      ),
                      itemCount: _gods.length,
                    );
                  } else {
                    return const Center(
                      child: Text("Loading..."),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
