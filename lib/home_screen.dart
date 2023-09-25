import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyquotes/quote_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/green.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("quotes").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("An error occurred"));
              } else if (snapshot.data != null &&
                  snapshot.data!.docs.isNotEmpty) {
                return PageView.builder(
                    itemCount: snapshot.data?.docs.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return QuoteScreen(snapshot: snapshot.data!.docs[index]);
                    });
              } else {
                return Center(child: Text("No data found"));
              }
            }),
       // floatingActionButton:,
      ),
    );
  }
}
