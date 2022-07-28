import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/modules/Forume.dart';
import 'package:hippone_museum/services/be.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);
  static String id = "MarketPage";

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
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
              "assets/Marche.PNG",
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
                stream: _backend.loadMarket(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Market> _markets = [];

                    for (var doc in snapshot.data!.docs) {
                      var data = doc;
                      _markets.add(
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
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            _markets[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade400,
                                fontSize: 25),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            _markets[index].text1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _markets[index].imageUrl1.isNotEmpty
                              ? Image.network(
                                  _markets[index].imageUrl1,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _markets[index].text2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _markets[index].text3,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _markets[index].imageUrl2.isNotEmpty
                              ? Image.network(
                                  _markets[index].imageUrl2,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          const SizedBox(
                            height: 20,
                          ),
                          _markets[index].imageUrl3.isNotEmpty
                              ? Image.network(
                                  _markets[index].imageUrl3,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                        ],
                      )),
                      itemCount: _markets.length,
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
