import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import '../models/textbook_data.dart';
import 'piechart_screen.dart';

class ChangeNumber extends StatefulWidget {
  final String textbookTitle;
  final int textbookNumber;
  final int achievenumber;
  final int index;

  const ChangeNumber(
      this.textbookTitle, this.textbookNumber, this.achievenumber, this.index,
      {super.key});

  @override
  State<ChangeNumber> createState() => _ChangeNumberState();
}

class _ChangeNumberState extends State<ChangeNumber> {
  int _currentIntValue = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<TextBookData>(builder: (context, textbookData, child) {
      final textbook = textbookData.textbooks[widget.index];

      return Container(
        color: const Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Text(
              "編集",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(221, 244, 244, 244),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: NumberPicker(
                  itemHeight: 50,
                  itemCount: 7,
                  value: _currentIntValue,
                  minValue: 0,
                  maxValue: textbook.number,
                  onChanged: (newValue) =>
                      setState(() => _currentIntValue = newValue)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TextBookData>(context, listen: false)
                    .updateAchieveNumber(widget.index, _currentIntValue);
                Navigator.pop(context);
                //                    Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) =>  PieChartScreen(widget.textbookTitle, widget.textbookNumber, widget.index , widget.achievenumber),
                //   ),
                // );
              },
              child: Text(
                "保存する",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            )
          ]),
        ),
      );
    });
  }
}
