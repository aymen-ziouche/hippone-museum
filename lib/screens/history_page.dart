import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/modules/Museum.dart';
import 'package:hippone_museum/services/be.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static String id = "HistoryPage";

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
            Image.asset(
              "assets/museum.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: StreamBuilder<QuerySnapshot>(
                stream: _backend.loadHistory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Museum> _history = [];

                    for (var doc in snapshot.data!.docs) {
                      var data = doc;
                      _history.add(
                        Museum(
                          imageUrl1:
                              data.data().toString().contains('ImageUrl1')
                                  ? doc.get('ImageUrl1')
                                  : "",
                          imageUrl2:
                              data.data().toString().contains('ImageUrl2')
                                  ? doc.get('ImageUrl2')
                                  : "",
                          text1: data.data().toString().contains('Text1')
                              ? doc.get('Text1')
                              : "",
                          text2: data.data().toString().contains('Text2')
                              ? doc.get('Text2')
                              : "",
                          text3: data.data().toString().contains('Text3')
                              ? doc.get('Text3')
                              : "",
                          text4: data.data().toString().contains('Text4')
                              ? doc.get('Text4')
                              : "",
                          title: data.data().toString().contains('Title')
                              ? doc.get('Title')
                              : "",
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            _history[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.yellow.shade400, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _history[index].text1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _history[index].imageUrl1.isNotEmpty
                              ? Image.network(
                                  _history[index].imageUrl1,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _history[index].text2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _history[index].text3,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _history[index].text4,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _history[index].imageUrl2.isNotEmpty
                              ? Image.network(
                                  _history[index].imageUrl2,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                      itemCount: _history.length,
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
