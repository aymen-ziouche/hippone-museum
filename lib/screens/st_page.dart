import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/modules/Museum.dart';
import 'package:hippone_museum/modules/st.dart';
import 'package:hippone_museum/services/be.dart';

class SaintPage extends StatefulWidget {
  const SaintPage({Key? key}) : super(key: key);
  static String id = "SaintPage";

  @override
  State<SaintPage> createState() => _SaintPageState();
}

class _SaintPageState extends State<SaintPage> {
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
              "assets/st1.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: StreamBuilder<QuerySnapshot>(
                stream: _backend.loadsaint(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Saint> _st = [];

                    for (var doc in snapshot.data!.docs) {
                      var data = doc;
                      _st.add(
                        Saint(
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
                          imageUrl4:
                              data.data().toString().contains('ImageUrl4')
                                  ? doc.get('ImageUrl4')
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
                        children: [
                          Text(
                            _st[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.yellow.shade400, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _st[index].text1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _st[index].imageUrl1.isNotEmpty
                              ? Image.network(
                                  _st[index].imageUrl1,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          _st[index].imageUrl2.isNotEmpty
                              ? Image.network(
                                  _st[index].imageUrl2,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _st[index].text2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _st[index].text3,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _st[index].text4,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _st[index].imageUrl3.isNotEmpty
                              ? Image.network(
                                  _st[index].imageUrl3,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          _st[index].imageUrl4.isNotEmpty
                              ? Image.network(
                                  _st[index].imageUrl4,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                      itemCount: _st.length,
                    );
                  } else {
                    return const Center(
                      child: Text("Loading...",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
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
