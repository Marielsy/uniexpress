import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDriver() async {
  List driver = [];
  CollectionReference collectionReferenceDriver = db.collection('driver');

  QuerySnapshot queryDriver = await collectionReferenceDriver.get();
  queryDriver.docs.forEach((documento) {});
  return driver;
}
