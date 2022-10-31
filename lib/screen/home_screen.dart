import 'package:flutter/material.dart';
import 'package:tes/helper/database_helper.dart';
import 'package:tes/widget/modal_form.dart';
import 'package:tes/model/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> listItem = [];
  DatabaseHelper db = DatabaseHelper();

  @override
  initState() {
    _getAllData(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return Text(
            listItem[index].itemName as String,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModalForm(),
            ),
          ).then(
            _getAllData,
          );
        },
      ),
    );
  }

  Future _getAllData(dynamic value) async {
    var list = await db.getData();
    setState(() {
      listItem.clear();
      list!.forEach((item) {
        listItem.add(
          Item.fromMap(
            item,
          ),
        );
      });
    });
  }
}
