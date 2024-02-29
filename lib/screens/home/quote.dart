import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  const Quote({super.key, required this.snapshot});
  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Text(snapshot['quote']);
  }
}
