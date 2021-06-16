import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store.dart';

class AddStoreViewModel {

  // add_store_pageの画面が下記に該当
  String storeName = "";
  String storeAddress = "";

  // textfieldで取得した値をここでキャッチして保存。
  void saveStore() {
    // storemodel から storeオブジェクトを作成
    final store = Store(storeName, storeAddress);
    // addはmap型で返すのでtoMapで合わせる
    FirebaseFirestore.instance.collection("stores")
      .add(store.toMap());
  }

}