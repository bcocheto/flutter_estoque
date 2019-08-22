import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  bool _isChecked = true;
  String _currText = '';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new SizedBox(
            height: 15,
          ),
          new Center(
            child: Text(
              'Cadastro de Produtos',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          ),
          new SizedBox(
            height: 15,
          ),
          new ListTile(
            leading: Icon(Icons.near_me),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Item',
              ),
            ),
          ),
          new ListTile(
            leading: Icon(Icons.confirmation_number),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Quantidade',
              ),
            ),
          ),
          new SizedBox(
            height: 15,
          ),
          new CheckboxListTile(
            value: _isChecked,
            title: new Text('Hello World'),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: new Text('Subtitle'),
            secondary: new Icon(Icons.archive),
            activeColor: Colors.red,
            onChanged: (val) {
              setState(() {
                _isChecked = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
