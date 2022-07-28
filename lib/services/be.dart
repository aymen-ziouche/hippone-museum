import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BackEnd {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> loadArtworks() {
    return _firestore.collection("Inside").snapshots();
  }

  Stream<QuerySnapshot> LoadGods() {
    return _firestore.collection("Gods").snapshots();
  }

  Stream<QuerySnapshot> LoadForum() {
    return _firestore.collection("Forum").snapshots();
  }

  Stream<QuerySnapshot> loadMarket() {
    return _firestore.collection("Marche").snapshots();
  }

  Stream<QuerySnapshot> loadHistory() {
    return _firestore.collection("Museum").snapshots();
  }

  Stream<QuerySnapshot> loadAnnaba() {
    return _firestore.collection("Histoire").snapshots();
  }

  Stream<QuerySnapshot> loadPont() {
    return _firestore.collection("Pont").snapshots();
  }

  Stream<QuerySnapshot> loadsaint() {
    return _firestore.collection("st-augustin").snapshots();
  }
}
