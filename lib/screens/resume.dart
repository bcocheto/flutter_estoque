import 'package:estoque/util/chart/chart-bar.dart';
import 'package:estoque/util/chart/chart-bat-2.dart';
import 'package:estoque/util/chart/chart-pie.dart';
import 'package:estoque/util/chart/charts-line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          children: <Widget>[
            Scaffold(
              body: new Card(
                elevation: 15,
                child: Padding(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: PieChartSample2()
                ),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: Padding(
                  padding: EdgeInsets.only(left: 4, right: 5),
                  child: LineChartSample4()
                ),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: BarChartSample2()
                
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: BarChartSample1()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
