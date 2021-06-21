
import 'package:flutter/material.dart';
import 'package:grocery_app/view_models/store_view_model.dart';

class StoreItemListPage extends StatelessWidget {

  final StoreViewModel store;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // storeにパスさせないと、
  // どのアイテムがどの店に所属しているかがわからない
  StoreItemListPage({this.store});

  String _validate(String value) {
    if(value.isEmpty) {
      return "Field cannot be empty";
    }

    return null;
  }

  void _saveStoreItem() {

  }

  void _clearTextBoxes() {
    _nameController.clear();
    _priceController.clear();
    _quantityController.clear();
  }

  Widget _buildStoreItems() {
    return Container();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: _nameController,
            validator: _validate,
            decoration: InputDecoration(
                hintText: "Enter store item"
            ),
          ),
          TextFormField(
            controller: _priceController,
            validator: _validate,
            decoration: InputDecoration(
                hintText: "Enter price"
            ),
          ),
          TextFormField(
            controller: _quantityController,
            validator: _validate,
            decoration: InputDecoration(
                hintText: "Enter quantity"
            ),
          ),
          RaisedButton(
            child: Text("Save", style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {

            },
          ),
          Expanded(
              child: _buildStoreItems()
          )

        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text(store.name),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
        ),
        body: _buildBody()
    );

  }
}