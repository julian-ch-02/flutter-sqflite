import 'package:flutter/material.dart';
import 'package:tes/helper/database_helper.dart';
import 'package:tes/model/item.dart';

class ModalForm extends StatelessWidget {
  ModalForm({Key? key}) : super(key: key);
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();

    Future<void> _submit(context) async {
      await db.saveData(
        Item(
          itemName: usernameController.text,
        ),
      );
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Item name'),
                controller: usernameController,
              ),
              ElevatedButton(
                onPressed: () => _submit(context),
                child: const Text(
                  'Add',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
