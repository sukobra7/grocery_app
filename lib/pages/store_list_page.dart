
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/add_store_page.dart';

class StoreListPage extends StatefulWidget {
  @override
  _StoreListPage createState() => _StoreListPage();
}

class _StoreListPage extends State<StoreListPage> {

  Widget _buildBody() {
    return Text("");
  }

  void _navigateToAddStorePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddStorePage(),
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
