import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  late Future<List<CardModel>> fetchDataFuture;

  @override
  void initState() {
    super.initState();
    fetchDataFuture = _fetchDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardModel>>(
      future: fetchDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final fetchedData = snapshot.data;

        if (fetchedData == null || fetchedData.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return ShowCaseContent(crossAxisCount: 2, data: fetchedData);
      },
    );
  }

  Future<List<CardModel>> _fetchDataFromFirestore() async {
    final data = await FirebaseRepository().fetchRecentsFromFirestore();
    return data;
  }
}