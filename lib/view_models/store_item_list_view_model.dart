import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store_item.dart';
import 'package:grocery_app/view_models/store_view_model.dart';

class StoreItemListViewModel {

  String name;
  double price;
  int quantity;

  final StoreViewModel store;

  StoreItemListViewModel({this.store});

  Stream<QuerySnapshot> get storeItemsAsStream {
    return FirebaseFirestore.instance.collection("stores")
    .doc(store.storeId)
    .collection("items")
    .snapshots();
  }

  void saveStoreItem() {
    final storeItem = StoreItem(name, price, quantity);

    // ここでstoreidを用いて特定のstoreを指定
    // そのサブコレクションitemsにstoreitemを追加していく。
    FirebaseFirestore.instance.collection("stores")
    .doc(store.storeId)
    .collection("items")
    .add(storeItem.toMap());
  }
}

