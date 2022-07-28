import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hippone_museum/modules/Artwork.dart';

class DetailsPage extends StatefulWidget {
  final Artwork artwork;

  const DetailsPage({
    Key? key,
    required this.artwork,
  }) : super(key: key);
  static String id = "DetailsPage";

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // initialize artwork object with data from  last screen

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              widget.artwork.imageUrl.isNotEmpty
                  ? Image.network(
                      widget.artwork.imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Placeholder(
                      color: Colors.white,
                    ),
              const SizedBox(height: 10),
              Text(
                widget.artwork.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.artwork.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
