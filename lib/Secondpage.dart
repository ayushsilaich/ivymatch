import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //new
  CollectionReference _referenceUserData =
      FirebaseFirestore.instance.collection('users');

  late Stream<QuerySnapshot> _streamDataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamDataList = _referenceUserData.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('IvyMatch'),
      ),
      body: StreamBuilder(
        stream: _streamDataList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> listQueryDocumentSnapshot =
                querySnapshot.docs;

            return Padding(
                padding: const EdgeInsets.all(24),
                child: Table(
                  border: TableBorder.all(color: Colors.black),
                  children: List<TableRow>.generate(
                    listQueryDocumentSnapshot.length,
                    (index) {
                      final person = listQueryDocumentSnapshot[index];
                      return TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(person['name'],
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(person['about'],
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(person['phone number'].toString(),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      );
                    },
                    growable: false,
                  ),
                ));

          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
