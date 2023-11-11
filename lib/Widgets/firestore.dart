import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTextfield extends StatefulWidget {
  const FirestoreTextfield({Key? key}) : super(key: key);

  @override
  _FirestoreTextfieldState createState() => _FirestoreTextfieldState();
}

class _FirestoreTextfieldState extends State<FirestoreTextfield> {
  final TextEditingController _textEditingController = TextEditingController();
  final CollectionReference _firestoreCollection =
      FirebaseFirestore.instance.collection('flutterData');

  void _addDataToFirestore() async {
    final String text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      await _firestoreCollection.add({'text': text});
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(labelText: 'Enter text'),
          ),
          ElevatedButton(
            onPressed: _addDataToFirestore,
            child: const Text('Send to Firestore'),
          ),
        ],
      ),
    );
  }
}
