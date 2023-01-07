import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookstore/util/rounded_button.dart';

class EditBook extends StatefulWidget {

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController judulController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController docId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final databaseFirestore = FirebaseFirestore.instance;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('Edit Data Book'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
          child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Edit Book",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: docId,
                decoration: const InputDecoration(hintText: "DocId"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'DocId dibutuhkan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: judulController,
                decoration: const InputDecoration(hintText: "Judul"),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Judul Dibutuhkan';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: hargaController,
                decoration: const InputDecoration(hintText: "Harga"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "HARGA dibutuhkan";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Edit Data',
                  onPressed: () {
                    // if
                    if (formKey.currentState!.validate()) {
                      final user = <String, dynamic>{
                        'judul': judulController.text,
                        'harga': int.tryParse(hargaController.text),
                      };
                      // firestore untuk melakukan update ke firebasestore
                      databaseFirestore
                          //.collection(docJudul)
                          .collection("users")
                          .doc(docId.text)
                          .update(user)
                          .onError(
                              (e, _) => print("Error writing document: $e"));
                      judulController.text = '';
                      hargaController.text = '';
                    }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
