import 'package:cloud_firestore/cloud_firestore.dart';

class StoreListViewModel {
  // データ変更時に自動でView側も更新
  Stream<QuerySnapshot> get storeAsStream  {
    return FirebaseFirestore.instance.collection("stores").snapshots();
  }
}