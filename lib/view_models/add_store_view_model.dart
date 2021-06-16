import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store.dart';

class AddStoreViewModel {

  // add_store_pageの画面が下記に該当
  String storeName = "";
  String storeAddress = "";
  String message = "";

  // textfieldで取得した値をここでキャッチして保存。
  // voidで返すのではなくfuture(promise)で返す
  Future<bool> saveStore() async {

    bool isSaved = false;
    // storemodel から storeオブジェクトを作成
    final store = Store(storeName, storeAddress);
    //addはmap型で返すのでtoMapで合わせる

    // tryはキャッチと共に使う
    try {
      await FirebaseFirestore.instance.collection("stores")
      .add(store.toMap());
      isSaved = true;
    } on Exception catch(_) {
      message = "Unable to save the store";
    } catch(error) {
      message = "Error occured!";
    }

    return isSaved;

  }

}