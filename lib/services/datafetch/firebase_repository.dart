import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/card_model.dart';

class FirebaseRepository {
  void saveCode(String title, String email, String code, String classT) {
    FirebaseFirestore.instance
        .collection('recents')
        .add({'title': title, 'email': email, 'code': code, 'classT': classT});
  }

  Future<List<CardModel>> fetchRecentsFromFirestore() async {

    final CollectionReference collection =
        FirebaseFirestore.instance.collection('recents');

    try {
      final QuerySnapshot snapshot = await collection.get();
      final List<CardModel> recents = [];

      for (final DocumentSnapshot doc in snapshot.docs) {
        final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          final String email = data['email'] ?? '';
          final String code = data['code'] ?? '';
          final String classT = data['classT'] ?? '';
          final String title = data['title'] ?? '';

          final CardModel card = CardModel(email, code, classT, null, title);
          recents.add(card);
        }
      }

      return recents;
    } catch (e) {
      debugPrint('Error fetching recents: $e');
      return [];
    }
  }
  
}
