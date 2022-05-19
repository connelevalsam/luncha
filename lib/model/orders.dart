import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersDao {
  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  // void saveMessage(User user) {
  //   collection.add(user.toJson());
  // }

  Stream<QuerySnapshot> getUserStream() {
    print("============= hewrw0");
    return collection.snapshots();
  }
}
