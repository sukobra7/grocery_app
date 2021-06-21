import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store.dart';

class StoreViewModel {

  final Store store;

  StoreViewModel({this.store});

  String get storeID {
    return store.storeID;
  }

  String get name {
    return store.name;
  }

  String get address {
    return store.address;
  }

  factory StoreViewModel.fromSnapshot(QueryDocumentSnapshot doc) {

    // storemodelはfromsnapshotを呼び出すfunctionがないのでstoreモデルで定義
    final store = Store.fromSnapshot(doc);
    return StoreViewModel(store: store);
  }
}