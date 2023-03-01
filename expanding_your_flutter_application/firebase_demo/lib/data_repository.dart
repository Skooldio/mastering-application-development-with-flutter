import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('cities');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> add() {
    return collection.add({"name": "Test", "country": "Thailand"});
  }

  void delete(String ref) async {
    await collection.doc(ref).delete();
  }
}
