import 'package:flutter/material.dart';

Widget listItem(
  String imageUrl,
  String title,
) {
  return SizedBox(
    width: double.infinity,
    height: 150,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            width: double.maxFinite,
            child: Image.asset(imageUrl, fit: BoxFit.cover)),
        Positioned(
          right: 0,
          left: 0,
          bottom: 20,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 15,
                )
              ],
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
