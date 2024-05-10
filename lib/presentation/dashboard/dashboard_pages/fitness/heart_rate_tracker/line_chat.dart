import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LineChart(
        swapAnimationDuration: const Duration(milliseconds: 250),
        sampleData1);
  }
}

LineChartData get sampleData1 => LineChartData(
  gridData: gridData,
  titlesData: titlesData,
  borderData: borderData,
  lineBarsData: lineBarsData,
  minX: 0,
  maxX: 14,
  minY: 0,
  maxY: 4,
);

List<LineChartBarData> get lineBarsData => [
  // lineChartBarData1,
  lineChartBarData2
];


FlTitlesData get titlesData => FlTitlesData(
  bottomTitles: AxisTitles(
    sideTitles: bottomTitles,
  ),
  rightTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  topTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  leftTitles: AxisTitles(
    sideTitles: leftTitles(),
  ),
);

Widget leftTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  String text;
  switch (value.toInt()) {
    case 1:
      text = "25";
      break;
    case 2:
      text = "50";
      break;
    case 3:
      text = "75";
      break;

    case 4:
      text = "100";
      break;

    case 5:
      text = "125";
      break;

    case 6:
      text = "150";
      break;

    case 7:
      text = "175";
      break;

    case 8:
      text = "200";
      break;


    default:
      return Container();
  }
  return Text(
    text,
    style: style,
    textAlign: TextAlign.center,
  );
}

SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitlesWidget,
    showTitles: true,
    interval: 1,
    reservedSize: 40);

Widget bottomTitlesWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  Widget text;

  switch (value.toInt()) {
    case 4:
      text = const Text(
        'Mon',
        style: style,
      );
      break;

    case 8:
      text = const Text(
        'Tue',
        style: style,
      );
      break;

    case 12:
      text = const Text(
        'Wed',
        style: style,
      );
      break;

    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    child: text,
    axisSide: meta.axisSide,
    space: 10,
  );
}

SideTitles get bottomTitles => SideTitles(
  showTitles: true,
  reservedSize: 32,
  interval: 1,
  getTitlesWidget: bottomTitlesWidgets,
);

FlGridData get gridData => FlGridData(show: true,);

FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom: BorderSide(color: Colors.grey, width: 4),
      left: const BorderSide(color: Colors.grey),
      right: const BorderSide(color: Colors.grey),
      top: const BorderSide(color: Colors.grey),
    ));

LineChartBarData get lineChartBarData1 => LineChartBarData(
    isCurved: true,
    color: Colors.purple,
    // barWidth: 6,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(0, 0),
      FlSpot(3, 1.5),
      FlSpot(5, 1.6),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.5),
      FlSpot(13, 1.6),
    ]);


LineChartBarData get lineChartBarData2 => LineChartBarData(
    isCurved: true,
    color: Colors.green,
    // barWidth: 6,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 2),
      FlSpot(3, 1),
      FlSpot(5, 3),
      FlSpot(7, 3.4),
      FlSpot(10, 2.3),
      FlSpot(12, 2.9),
      FlSpot(13, 3),
    ]);
