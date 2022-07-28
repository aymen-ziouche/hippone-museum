// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:hippone_museum/customwidgets/custom_sculpture_list_item.dart';
import 'package:hippone_museum/screens/details_page.dart';

class SculpturesPage extends StatefulWidget {
  const SculpturesPage({Key? key}) : super(key: key);
  static String id = "SculpturesPage";

  @override
  State<SculpturesPage> createState() => _SculpturesPageState();
}

class _SculpturesPageState extends State<SculpturesPage> {
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
              "assets/background.jpeg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: const Text(
                "Sculptures :",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return secondListItem(
                    "assets/background.jpeg",
                    "Sculpture ${index + 1}",
                    "description of sculpture ${index + 1}",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
