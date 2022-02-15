import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttercounter/services/Firestore.service.dart';

class CounterService {
  final FirestoreService _db = FirestoreService.init(collection: "counters");

  Future<void> increment(String id) async {
    await _db.update({'count': FieldValue.increment(1), "id": id});
  }

  Future<void> decrement(String id) async {
    await _db.update({'count': FieldValue.increment(-1), "id": id});
  }

  Future<void> reset(String id) async {
    await _db.update({'count': 0, "id": id});
  }

  Stream<int> getCount(String id) {
    return _db
        .getStream(id: id)
        .map((snapshot) => snapshot.data()?['count'] ?? 0);
  }
}
