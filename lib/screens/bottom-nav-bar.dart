import 'package:estoque/screens/add-page.dart';
import 'package:estoque/screens/resume.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  Widget _getWidget() {
    //Responsável por setar o index das páginas
    switch (currentIndex) {
      case 0:
        return Container(
          child: HomePage(),
        );
        break;
      case 1:
        return Container(
          child: AddPage(),
        );
        break;
      case 2:
        return Container(
          child: ResumePage(),
        );
        break;
      default:
        return Container(
          child: Container(),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Estoque',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedIconTheme: IconThemeData(color: Colors.black,size: 30),
        selectedIconTheme: IconThemeData(color: Colors.grey,size: 45),
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Inicio')),
            BottomNavigationBarItem(icon: Icon(Icons.add_box),title: Text('Adicionar')),
            BottomNavigationBarItem(icon: Icon(Icons.view_list),title: Text('Resumo'))
          ]),
      body: _getWidget(),
    );
  }
}
