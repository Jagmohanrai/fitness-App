import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePageBarChart extends StatefulWidget {
  @override
  _HomePageBarChartState createState() => _HomePageBarChartState();
}

class _HomePageBarChartState extends State<HomePageBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.transparent,
        shadowColor: Colors.black,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: const Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Mn';
                    case 1:
                      return 'Te';
                    case 2:
                      return 'Wd';
                    case 3:
                      return 'Tu';
                    case 4:
                      return 'Fr';
                    case 5:
                      return 'St';
                    case 6:
                      return 'Sn';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(
                  showTitles: true,
                  interval: 6.0,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "Quicksand-Bold",
                  )),
            ),
            borderData: FlBorderData(
                show: true,
                border:
                    Border.all(color: Colors.white, style: BorderStyle.solid)),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(y: 8, color: Colors.lightBlueAccent)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(y: 10, color: Colors.lightBlueAccent)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(y: 14, color: Colors.lightBlueAccent)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(y: 15, color: Colors.lightBlueAccent)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(y: 13, color: Colors.lightBlueAccent)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(y: 10, color: Colors.lightBlueAccent)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(y: 10, color: Colors.lightBlueAccent)
              ], showingTooltipIndicators: [
                0
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
