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

}