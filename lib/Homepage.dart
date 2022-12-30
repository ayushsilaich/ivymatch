import 'package:flutter/material.dart';
import 'package:form_app/Secondpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //new
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('IvyMatch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  'Form',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _textController2,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      _textController2.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _textController3,
              decoration: InputDecoration(
                hintText: 'About',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      _textController3.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              onPressed: () async {
                var name = _textController.text;
                var phoneNumber = _textController2.text;
                var about = _textController3.text;
                //new
                await users.add({
                  'name': name,
                  'phone number': phoneNumber,
                  'about': about
                }).then((value) => print('user added'));

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
                _textController.clear();
                _textController2.clear();
                _textController3.clear();
              },
              color: Colors.blue,
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
