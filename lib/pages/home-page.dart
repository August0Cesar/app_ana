import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/commons.widget/custom-card.dart';
import 'package:myapp/models/item.dart';
import 'package:myapp/pages/form-cliente.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  List<Item> todos = new List<Item>();

  MyHomePage({Key key, this.title}) {
    todos = [];
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = new TextEditingController();

  _MyHomePageState() {
    loadData();
  }

  Future saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('data', jsonEncode(widget.todos));
  }

  Future loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = await prefs.get('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();

      setState(() {
        widget.todos = result;
      });
    }
  }

  removeItem(int index) {
    setState(() {
      widget.todos.removeAt(index);
      saveData();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encomendas"),
      ),
      body: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          return CustomCard(widget.todos[index].name, null, "descrption",
              widget.todos[index].done);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormClientePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
