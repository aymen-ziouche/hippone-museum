import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/modules/Forume.dart';
import 'package:hippone_museum/modules/pont.dart';
import 'package:hippone_museum/services/be.dart';

class PontPage extends StatefulWidget {
  const PontPage({Key? key}) : super(key: key);
  static String id = "PontPage";

  @override
  State<PontPage> createState() => _PontPageState();
}

class _PontPageState extends State<PontPage> {
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
          children: [
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/hippone-museum-ee5b4.appspot.com/o/Pont%20R.JPG?alt=media&token=7b7b94f4-6cf8-40bd-9bfb-34034bf63b84",
                fit: BoxFit.cover),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: StreamBuilder<QuerySnapshot>(
                stream: _backend.loadPont(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Pont> _pont = [];

                    for (var doc in snapshot.data!.docs) {
                      var data = doc;
                      _pont.add(
                        Pont(
                          imageUrl1:
                              data.data().toString().contains('ImageUrl1')
                                  ? doc.get('ImageUrl1')
                                  : "",
                          imageUrl2:
                              data.data().toString().contains('ImageUrl2')
                                  ? doc.get('ImageUrl2')
                                  : "",
                          imageUrl3:
                              data.data().toString().contains('ImageUrl3')
                                  ? doc.get('ImageUrl3')
                                  : "",
                          text1: data.data().toString().contains('Text1')
                              ? doc.get('Text1')
                              : "",
                          text2: data.data().toString().contains('Text2')
                              ? doc.get('Text2')
                              : "",
                          name: data.data().toString().contains('Name')
                              ? doc.get('Name')
                              : "",
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            _pont[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.yellow.shade400, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _pont[index].text1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _pont[index].text2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _pont[index].imageUrl1.isNotEmpty
                              ? Image.network(
                                  _pont[index].imageUrl1,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          const SizedBox(
                            height: 20,
                          ),
                          _pont[index].imageUrl2.isNotEmpty
                              ? Image.network(
                                  _pont[index].imageUrl2,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          const SizedBox(
                            height: 20,
                          ),
                          _pont[index].imageUrl3.isNotEmpty
                              ? Image.network(
                                  _pont[index].imageUrl3,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                        ],
                      )),
                      itemCount: _pont.length,
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
