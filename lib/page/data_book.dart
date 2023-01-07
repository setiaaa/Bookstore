import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookstore/page/item_card.dart';
import 'package:bookstore/util/rounded_button.dart';


late User loggedinUser;

class DataBook extends StatefulWidget {
  @override
  _DataBook createState() => _DataBook();
}

class _DataBook extends State<DataBook> {
  final _auth = FirebaseAuth.instance;

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nrpController = TextEditingController();

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
                Navigator.pushNamed(context, 'home_screen');
                //Implement logout functionality
              }),
        ],
        title: Text('Data Buku'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              //// VIEW DATA HERE
              StreamBuilder(
                  stream: users.snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data!.docs
                            .map((e) => ItemCard(
                              (e.data() as dynamic)['judul'],
                              (e.data() as dynamic)['harga'],
                                    onUpdate: () {
                                      Navigator.pushNamed(context, 'edit_book');
                                    },
                                    onDelete: () {
                                  users.doc(e.id).delete();
                                }))
                            .toList() as List<Widget>,
                      );
                    } else {
                      return Text('Loading');
                    }

                    throw '';
                  })
            ],
          ),
        ]),
      )),
    );
  }
}
