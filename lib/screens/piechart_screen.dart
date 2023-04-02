import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;

import 'change_number_screen.dart';

class PieChartScreen extends StatefulWidget {
  final String textbookTitle;
  final int textbookNumber;
  final int achievenumber;
  final int index;

  PieChartScreen(
      this.textbookTitle, this.textbookNumber, this.index, this.achievenumber,
      {super.key});

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  //ここを動的にしてみせる。
  var dataMap = <String, double>{
    "完了": 15,
    "未達成": 30,
  };

  final colorList = <Color>[
    Color.fromARGB(255, 103, 202, 77),
    Color.fromARGB(255, 88, 95, 103),
  ];

  void changeNumber() {
    setState(() {});
  }

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.0),
        child: AppBar(
          leading: IconButton(
            color: Color.fromARGB(31, 18, 18, 18),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(widget.textbookTitle,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ChangeNumber(
                      widget.textbookTitle,
                      widget.textbookNumber,
                      widget.achievenumber,
                      widget.index),
                );
              },
              icon: Icon(Icons.mode_edit_outline),
              color: Colors.black87,
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 240, 240, 240),
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: PieChart(
              dataMap: dataMap,
              colorList: colorList,
              chartType: ChartType.ring,
              //ここが動的に変わってくれない。どうしたら良いだろうか。
              centerText: "${widget.achievenumber} / ${widget.textbookNumber}",
              legendOptions: LegendOptions(
                showLegends: true,
                legendPosition: LegendPosition.bottom,
              ),
              initialAngleInDegree: 270,
              animationDuration: Duration(milliseconds: 1080),
              chartValuesOptions: const ChartValuesOptions(
                chartValueBackgroundColor: Color.fromARGB(255, 255, 255, 255),
                showChartValuesOutside: false,
                showChartValuesInPercentage: true,
                showChartValueBackground: false,
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      //   backgroundColor: Color.fromARGB(255, 103, 202, 77),
      // ),
    );
  }
}
