import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookstore/util/rounded_button.dart';

late User loggedinUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

//using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text('Home Page'),
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
            RoundedButton(
                colour: Colors.greenAccent,
                title: 'Tambah Data',
                onPressed: () {
                  Navigator.pushNamed(context, 'add_book');
                }),
            RoundedButton(
                colour: Colors.red,
                title: 'Lihat Data Buku',
                onPressed: () {
                  Navigator.pushNamed(context, 'data_book');
                }),
            RoundedButton(
              colour: Colors.red,
              title: 'Logout',
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, 'login_screen');
              }
            )
          ],
        ),
      )),
    );
  }
}
