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
        title: Text(
          'Controle de Estoque',
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: new Theme(
        data: ThemeData.light(),
        child: BottomNavigationBar(
            elevation: 15,
            fixedColor: Colors.black,
            unselectedIconTheme: IconThemeData(color: Colors.grey, size: 30),
            selectedIconTheme: IconThemeData(color: Colors.black, size: 45),
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) => setState(() {
                  currentIndex = index;
                }),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(
                    'Inicio',
                    style: TextStyle(color: Colors.grey),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_box),
                  title: Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.grey),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_list),
                  title: Text(
                    'Resumo',
                    style: TextStyle(color: Colors.grey),
                  ))
            ]),
      ),
      body: _getWidget(),
    );
  }
}
