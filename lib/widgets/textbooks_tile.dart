import 'package:flutter/material.dart';
import '../screens/piechart_screen.dart';

class TextBookTile extends StatelessWidget {
  final String textbookTitle;
  final int textbookNumber;
  int achievenumber;
  final int index;

  TextBookTile({required this.textbookTitle, required this.textbookNumber, required this.achievenumber, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(textbookTitle),
      subtitle: Text("${achievenumber}/${textbookNumber}"),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  PieChartScreen(textbookTitle,textbookNumber, index , achievenumber),
    ),
  );
      },
    );
  }
}

