import 'package:estoque/util/chart/chart-bar.dart';
import 'package:estoque/util/chart/chart-donut.dart';
import 'package:estoque/util/chart/chart-line.dart';
import 'package:estoque/util/chart/chart-pie.dart';
import 'package:flutter/material.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key key}) : super(key: key);
  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          children: <Widget>[
            Scaffold(
              body: new Card(
                elevation: 15,
                child: Padding(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: PieChart.withSampleData()),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: Padding(
                    padding: EdgeInsets.only(left: 4, right: 5),
                    child: DonutChart.withSampleData()),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: BarChart1.withSampleData(),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: LineChart.withSampleData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
