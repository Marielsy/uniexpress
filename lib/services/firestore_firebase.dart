import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDriver() async {
  List driver = [];
  CollectionReference collectionReferenceDriver = db.collection('driver');

  QuerySnapshot queryDriver = await collectionReferenceDriver.get();
  // ignore: avoid_function_literals_in_foreach_calls
  queryDriver.docs.forEach((documento) {});
  return driver;
}
