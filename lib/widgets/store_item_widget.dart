
import 'package:flutter/material.dart';
import 'package:grocery_app/view_models/store_item_view_model.dart';

class StoreItemsWidget extends StatelessWidget {

  final List<StoreItemViewModel> storeItems;

  StoreItemsWidget({this.storeItems});

  Widget _buildItems(BuildContext context, int index) {

    final storeItem = storeItems[index];

    return ListTile(
      title: Text(storeItem.name)
    );
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: storeItems.length,
      itemBuilder: _buildItems,
    );

  }
}