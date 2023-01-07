import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookstore/util/rounded_button.dart';

late User loggedinUser;

class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController judulController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
//Implement logout functionality
              }),
        ],
        title: Text('Tambah Data Buku'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: judulController,
              decoration: InputDecoration(hintText: "JUDUL"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: hargaController,
              decoration: InputDecoration(hintText: "HARGA"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                colour: Colors.lightBlueAccent,
                title: 'Tambah Data',
                onPressed: () {
                  users.add({
                    'judul': judulController.text,
                    'harga': int.tryParse(hargaController.text),
                  });
                  judulController.text = '';
                  hargaController.text = '';
                }),
          ],
        ),
      )),
    );
  }
}
