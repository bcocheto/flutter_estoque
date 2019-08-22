import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Balanço do Ano",
          style: TextStyle(
              color: Colors.black54, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 38,
        ),
        SizedBox(
          width: 300,
          height: 200,
          child: FlChart(
            chart: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 4),
                      FlSpot(1, 3.5),
                      FlSpot(2, 4.5),
                      FlSpot(3, 1),
                      FlSpot(4, 4),
                      FlSpot(5, 6),
                      FlSpot(6, 6.5),
                      FlSpot(7, 6),
                      FlSpot(8, 4),
                      FlSpot(9, 6),
                      FlSpot(10, 6),
                      FlSpot(11, 7),
                    ],
                    isCurved: true,
                    barWidth: 7,
                    colors: [
                      Colors.purpleAccent,
                    ],
                    belowBarData: BelowBarData(
                      show: true,
                      colors: [Colors.deepPurple.withOpacity(0.2)],
                    ),
                    dotData: FlDotData(
                      show: false,
                    ),
                  ),
                ],
                minY: 0,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return '01';
                          case 1:
                            return '02';
                          case 2:
                            return '03';
                          case 3:
                            return '04';
                          case 4:
                            return '05';
                          case 5:
                            return '06';
                          case 6:
                            return '07';
                          case 7:
                            return '08';
                          case 8:
                            return '09';
                          case 9:
                            return '10';
                          case 10:
                            return '11';
                          case 11:
                            return '12';
                        }
                      }),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTitles: (value) {
                      return '\$ ${value + 0.5}';
                    },
                  ),
                ),
                gridData: FlGridData(
                    show: true,
                    checkToShowVerticalGrid: (double value) {
                      return value == 1 ||
                          value == 6 ||
                          value == 4 ||
                          value == 5;
                    }),
              ),
            ),
          ),
        )
      ],
    );
  }
}
