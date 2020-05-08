import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  String title;
  String date;
  String description;
  bool done;

  CustomCard(this.title, this.date, this.description, this.done);

  @override
  _CustomCard createState() => _CustomCard();
}

class _CustomCard extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Row(
        children: <Widget>[
          new Expanded(
            // flex: 2,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new ListTile(
                  // leading: new Icon(
                  //   Icons.account_circle,
                  //   color: Colors.black,
                  //   size: 15,
                  // ),
                  title: new Text(
                    "Augusto Cesar",//widget.title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  subtitle: new Text("5 Itens"),
                ),
              ],
            ),
          ),
          new Expanded(
            // flex: 1,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisSize: MainAxisSize.,
              children: <Widget>[
                Text("15,00 | 30,00"),
                new Padding(padding: EdgeInsets.only(top: 10.0)),
                Text("15/05/2020"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
