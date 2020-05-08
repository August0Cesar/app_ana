import 'package:flutter/material.dart';

class ListItens extends StatelessWidget {
  final int sizeList;
  final String item;
  final double valor;

  ListItens(this.item, this.valor, this.sizeList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(item,
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                      Text(valor.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ],
                  );
                },
                itemCount: 3,
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
    );
  }
}
