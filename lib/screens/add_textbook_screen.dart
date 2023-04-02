import 'package:achieve_management/models/textbook.dart';
import 'package:achieve_management/models/textbook_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddTextBookScreen extends StatelessWidget {
  const AddTextBookScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String? newTextBookTitle;
    String? newTextBookNumber;
    String? newAchieveNumber;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "教材を追加",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
             TextField(
              decoration: InputDecoration(
                  labelText: "教材の名前",
                  ),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newTextBookTitle = newText;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                decoration: InputDecoration(
                  labelText: "問題orページ数",
                  ),
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              onChanged: (newNumber){
                newTextBookNumber = newNumber;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                decoration: InputDecoration(
                  labelText: "既にクリアした問題数",
                  ),
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              onChanged: (newAchieveNum){
                newAchieveNumber = newAchieveNum;
              },
            ),
            const SizedBox(
              height: 60.0,
            ),
            ElevatedButton(
                onPressed: () {
                  //nameやnumberがnullだったときの処理も書く。
                  final textbook = TextBook(name: newTextBookTitle!, number: int.parse(newTextBookNumber!), achievenumber: int.parse(newAchieveNumber!));
                  Provider.of<TextBookData>(context, listen: false).addTextBook(textbook.name, textbook.number ,textbook.achievenumber);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: const Text("保存"))
          ],
        ),
      ),
    );
  }
}
