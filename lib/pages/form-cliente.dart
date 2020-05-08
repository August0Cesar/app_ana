import 'package:flutter/material.dart';
import 'package:myapp/commons.widget/date_field.dart';
import 'package:myapp/commons.widget/input_form.dart';

class FormClientePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de clientes"),
      ),
      body: FormCliente(),
    );
  }
}

class FormCliente extends StatefulWidget {
  @override
  _FormClientePageState createState() => _FormClientePageState();
}

class _FormClientePageState extends State<FormCliente> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  void _asyncInputNewItemDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastre novo item'),
          content: Container(
            height: 150,
            child: Column(
              children: <Widget>[
                ImputForm("Nome Item..."),
                new Padding(padding: EdgeInsets.only(top: 10.0)),
                ImputForm("Valor Item..."),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Cadastrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        height: double.infinity,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ImputForm("Digite nome do Cliente ..."),
                  new Padding(padding: EdgeInsets.only(top: 10.0)),
                  DateField(),
                  new Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ImputForm("Valor..."),
                      ),
                      new Padding(padding: EdgeInsets.only(left: 5.0)),
                      Expanded(
                        flex: 1,
                        child: ImputForm("Entrada..."),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20.0)),
                  Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                  new Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Itens do Orçamentos",
                        style: TextStyle(
                          color: hexToColor("#F2A03D"),
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      // FloatingActionButton(onPressed: (){},child: Icon(Icons.add),)
                      RaisedButton(
                        textColor: Colors.white,
                        padding: EdgeInsets.all(0),
                        color: Colors.redAccent,
                        onPressed: () {
                          _asyncInputNewItemDialog(context);
                        },
                        child: Icon(
                          Icons.add,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.only(top: 10.0)),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("item",
                                style: TextStyle(
                                  fontSize: 18.0,
                                )),
                            Text("10.50",
                                style: TextStyle(
                                  fontSize: 18.0,
                                )),
                          ],
                        );
                      },
                      itemCount: 5,
                    ),
                  ),
                  RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("Cadastrar".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
