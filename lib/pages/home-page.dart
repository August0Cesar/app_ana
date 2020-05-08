import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myapp/commons.widget/custom-card.dart';
import 'package:myapp/models/item.dart';
import 'package:myapp/pages/form-cliente.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

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

  Future<String> _callAlertError(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          content: Text(error),
          elevation: 24,
          actions: [
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("Ok"),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  Future<Void> _asyncInputNewItemDialog(BuildContext context) {
    String nomeCliente = '';

    return showDialog<Void>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Crie um novo cliente'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      autofocus: true,
                      decoration: new InputDecoration(
                          labelText: 'Novo Cliente', hintText: 'Digite nome'),
                      onChanged: (value) {
                        nomeCliente = value;
                      },
                    )),
                    BasicDateField(),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                setState(() {
                  widget.todos.add(new Item(name: nomeCliente, done: false));
                  nomeCliente = '';
                  saveData();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Data de Entrega'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
