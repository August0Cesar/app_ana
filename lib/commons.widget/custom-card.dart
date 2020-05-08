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
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ListTile(
                leading: new Icon(
                  Icons.account_circle,
                  color: Colors.redAccent,
                  size: 35,
                ),
                title: new Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: new Text(widget.description),
              ),
            ],
          ),
        ),
        new Checkbox(
            value: widget.done,
            onChanged: (value) {
              setState(() {
                widget.done = value;
              });
            })
      ],
    ));
  }
}
