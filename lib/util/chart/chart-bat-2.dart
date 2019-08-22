import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color barColor = Colors.blueAccent;
  final Color barBackgroundColor = const Color(0xff95a5a6);
  final double width = 22;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  StreamController<BarTouchResponse> barTouchedResultStreamController;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5);
    final barGroup2 = makeGroupData(1, 6.5);
    final barGroup3 = makeGroupData(2, 5);
    final barGroup4 = makeGroupData(3, 7.5);
    final barGroup5 = makeGroupData(4, 9);
    final barGroup6 = makeGroupData(5, 11.5);
    final barGroup7 = makeGroupData(6, 6.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;

    barTouchedResultStreamController = StreamController();
    barTouchedResultStreamController.stream
        .distinct()
        .listen((BarTouchResponse response) {
      if (response == null) {
        return;
      }

      if (response.spot == null) {
        setState(() {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        });
        return;
      }

      touchedGroupIndex =
          showingBarGroups.indexOf(response.spot.touchedBarGroup);

      setState(() {
        if (response.touchInput is FlLongPressEnd) {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        } else {
          showingBarGroups = List.of(rawBarGroups);
          if (touchedGroupIndex != -1) {
            showingBarGroups[touchedGroupIndex] =
                showingBarGroups[touchedGroupIndex].copyWith(
              barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                return rod.copyWith(color: Colors.yellow, y: rod.y + 1);
              }).toList(),
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Balanço da Semana",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Vendas",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 38,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FlChart(
                  chart: BarChart(BarChartData(
                    barTouchData: BarTouchData(
                      touchTooltipData: TouchTooltipData(
                          tooltipBgColor: Colors.blueGrey,
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map((touchedSpot) {
                              String weekDay;
                              switch (touchedSpot.spot.x.toInt()) {
                                case 0:
                                  weekDay = 'Segunda';
                                  break;
                                case 1:
                                  weekDay = 'Terça';
                                  break;
                                case 2:
                                  weekDay = 'Quarta';
                                  break;
                                case 3:
                                  weekDay = 'Quinta';
                                  break;
                                case 4:
                                  weekDay = 'Sexta';
                                  break;
                                case 5:
                                  weekDay = 'Sábado';
                                  break;
                                case 6:
                                  weekDay = 'Domingo';
                                  break;
                              }
                              return TooltipItem(
                                  weekDay +
                                      '\n' +
                                      touchedSpot.spot.y.toString(),
                                  TextStyle(color: Colors.yellow));
                            }).toList();
                          }),
                      touchResponseSink: barTouchedResultStreamController.sink,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 16,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'S';
                              case 1:
                                return 'T';
                              case 2:
                                return 'Q';
                              case 3:
                                return 'Q';
                              case 4:
                                return 'S';
                              case 5:
                                return 'S';
                              case 6:
                                return 'D';
                            }
                          }),
                      leftTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        color: barColor,
        width: width,
        isRound: true,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y: 20,
          color: barBackgroundColor,
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    barTouchedResultStreamController.close();
  }
}
