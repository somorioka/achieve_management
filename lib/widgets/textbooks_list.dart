import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/textbook.dart';
import '../models/textbook_data.dart';
import 'textbooks_tile.dart';

class TextBookList extends StatelessWidget {
  const TextBookList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TextBookData>(
    builder: (context, textbookData, child){
      return ListView.builder(
      itemBuilder: (context, index){
        final textbook = textbookData.textbooks[index];

        return Dismissible(
          key: ValueKey<TextBook>(textbook),
          background: Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "削除",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
            ),
          ),
          onDismissed: (direction) {
            textbookData.deleteTextBook(textbook);
          },
          child: TextBookTile(
            textbookTitle: textbook.name, 
            textbookNumber: textbook.number,
            achievenumber: textbook.achievenumber,
            index: index,
            ),
        );
        },
      itemCount: textbookData.textbookCount,
      );
    },
    );
  }
}
