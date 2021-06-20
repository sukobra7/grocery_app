
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/add_store_page.dart';
import 'package:grocery_app/utils/constants.dart';
import 'package:grocery_app/view_models/add_store_view_model.dart';
import 'package:grocery_app/view_models/store_list_view_model.dart';
import 'package:grocery_app/view_models/store_view_model.dart';
import 'package:grocery_app/widgets/empty_results_widget.dart';
import 'package:provider/provider.dart';

class StoreListPage extends StatefulWidget {
  @override
  _StoreListPage createState() => _StoreListPage();
}

class _StoreListPage extends State<StoreListPage> {

  StoreListViewModel _storeListVM = StoreListViewModel();

  Widget _buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeListVM.storeAsStream,
      // snapshotにはstreamからfetchしたデータが含まれている
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data.docs.isNotEmpty) {
          return _buildList(snapshot.data);
        } else {
          return EmptyResultsWidget(message: Constants.NO_STORES_FOUND);
        }
      }
    );
  }

  Widget _buildList(QuerySnapshot snapshot) {
    final stores = snapshot.docs.map((doc) => StoreViewModel.fromSnapshot(doc)).toList();
    return ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final store = stores[index];
        return _buildListItem(store);
      }
    );
  }

  Widget _buildListItem(StoreViewModel store) {
    return ListTile(
      title: Text(store.name),
      subtitle: Text(store.address)
    );
  }

  void _navigateToAddStorePage(BuildContext context) {
    // providerがaddstoreviewmodelに何かしらの変更を知らせる
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider
    // providerが発火した時に、viewmodelをコピー
    // notify listenerが呼ばれた時にそれがchildのpageに反映
      (create: (context) => AddStoreViewModel(),
        // storeviewmodelのインスタンスにアクセス可
        // 変更を知らされる度に、addstorepageが再ビルド

        child: AddStorePage()
      ),
    fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grocery App"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(Icons.add),
                onTap: () {
                  _navigateToAddStorePage(context);
                },
              ),
            )
          ],
        ),
        body: _buildBody());
  }
}
