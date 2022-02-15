import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _db;

  FirestoreService.init({required String collection})
      : _db = FirebaseFirestore.instance.collection(collection);

  Stream<DocumentSnapshot<Map<String, dynamic>>> getStream({required id}) {
    return _db
        .doc(id)
        .snapshots()
        .cast<DocumentSnapshot<Map<String, dynamic>>>();
  }

  Future<int> update(Map<String, dynamic> data) async {
    try {
      await _db.doc(data['id']).update(data);
      return 0;
    } catch (e) {
      print(e);
      return -1;
    }
  }
}
