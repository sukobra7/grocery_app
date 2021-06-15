import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store.dart';

class AddStoreViewModel {

  String storeName = "";
  String storeAddress = "";

  void saveStore() {
    final store = Store(storeName, storeAddress);

    FirebaseFirestore.instance.collection("stores")
      .add(store.toMap());
  }

}