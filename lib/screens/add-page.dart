import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          new Card(
            elevation: 8,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.near_me, color: Colors.black87),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: 'Item',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading:
                      Icon(Icons.confirmation_number, color: Colors.black87),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: 'Quantidade',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new SizedBox(
            height: 15,
          ),
          
        ],
      ),
    );
  }
}
