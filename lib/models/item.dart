class Item {
  String name;
  bool done;

  Item({this.name, this.done});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['done'] = this.done;
    return data;
  }
}
