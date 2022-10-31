class Item {
  int? id;
  String? itemName;

  Item({this.id, this.itemName});

  Item.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    itemName = data['itemName'];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'itemName': itemName};
  }
}
