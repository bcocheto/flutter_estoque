import 'package:estoque/util/date-time-chart.dart';
import 'package:estoque/util/simple-chart.dart';
import 'package:estoque/util/simple-pie-chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

final GlobalKey<AnimatedCircularChartState> _chartKey =
    new GlobalKey<AnimatedCircularChartState>();
List<CircularStackEntry> data = <CircularStackEntry>[
  new CircularStackEntry(
    <CircularSegmentEntry>[
      new CircularSegmentEntry(500.0, Colors.red, rankKey: 'Q1'),
      new CircularSegmentEntry(1000.0, Colors.green, rankKey: 'Q2'),
      new CircularSegmentEntry(2000.0, Colors.blue, rankKey: 'Q3'),
      new CircularSegmentEntry(1000.0, Colors.yellow, rankKey: 'Q4'),
    ],
    rankKey: 'Quarterly Profits',
  ),
];

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
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text('Quantidade do Estoque'),
                      SizedBox(
                        height: 25,
                      ),
                      new AnimatedCircularChart(
                        key: _chartKey,
                        size: Size(200, 200),
                        initialChartData: <CircularStackEntry>[
                          new CircularStackEntry(
                            <CircularSegmentEntry>[
                              new CircularSegmentEntry(
                                33.33,
                                Colors.blue[400],
                                rankKey: 'completed',
                              ),
                              new CircularSegmentEntry(
                                66.67,
                                Colors.blueGrey[600],
                                rankKey: 'remaining',
                              ),
                            ],
                            rankKey: 'progress',
                          ),
                        ],
                        chartType: CircularChartType.Radial,
                        percentageValues: true,
                        holeLabel: '1/3',
                        labelStyle: new TextStyle(
                          color: Colors.blueGrey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text('Quantidade de itens'),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: SizedBox(
                          width: 350,
                          height: 225,
                          child: PieOutsideLabelChart.withSampleData(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text('Vendas Anuais'),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: SizedBox(
                        width: 300,
                        height: 225,
                        child: SimpleBarChart.withSampleData(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Scaffold(
              body: new Card(
                elevation: 15,
                child: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text('Vendas Hoje'),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: SizedBox(
                          width: 350,
                          height: 225,
                          child: DateTimeComboLinePointChart.withSampleData(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
