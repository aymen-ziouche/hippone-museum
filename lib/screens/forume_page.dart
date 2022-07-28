import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/modules/Forume.dart';
import 'package:hippone_museum/services/be.dart';

class ForumePage extends StatefulWidget {
  const ForumePage({Key? key}) : super(key: key);
  static String id = "ForumePage";

  @override
  State<ForumePage> createState() => _ForumePageState();
}

class _ForumePageState extends State<ForumePage> {
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
              "assets/hippo2.PNG",
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
                stream: _backend.LoadForum(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Market> _forumes = [];

                    for (var doc in snapshot.data!.docs) {
                      var data = doc;
                      _forumes.add(
                        Market(
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
                          text3: data.data().toString().contains('Text3')
                              ? doc.get('Text3')
                              : "",
                          name: data.data().toString().contains('Name')
                              ? doc.get('Name')
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
                            _forumes[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.yellow.shade400, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _forumes[index].text1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _forumes[index].imageUrl1.isNotEmpty
                              ? Image.network(
                                  _forumes[index].imageUrl1,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _forumes[index].text2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _forumes[index].text3,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _forumes[index].imageUrl2.isNotEmpty
                              ? Image.network(
                                  _forumes[index].imageUrl2,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          _forumes[index].imageUrl3.isNotEmpty
                              ? Image.network(
                                  _forumes[index].imageUrl3,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                        ],
                      )),
                      itemCount: _forumes.length,
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
