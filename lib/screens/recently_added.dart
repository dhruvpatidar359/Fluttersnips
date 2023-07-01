import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  List<CardModel> fetchedData = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _fetchDataFromFirestore(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return ShowCaseContent(crossAxisCount: 2, data: fetchedData);
      },
    );
  }

  Future<void> _fetchDataFromFirestore() async {
    final data = await FirebaseRepository().fetchRecentsFromFirestore();
    setState(() => fetchedData = data);
  }
}
