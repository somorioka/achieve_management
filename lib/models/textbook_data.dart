import 'package:achieve_management/models/textbook.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TextBookData extends ChangeNotifier {

  List<TextBook> _textbooks = [
    TextBook(name: "物理のエッセンス（例）", number: 352, achievenumber: 150),
    TextBook(name: "良問の風（例）", number: 148 , achievenumber: 25),
    TextBook(name: "名門の森（例）", number: 137, achievenumber: 40),
  ];

  UnmodifiableListView<TextBook> get textbooks {
    return UnmodifiableListView(_textbooks);
  }

  int get textbookCount {
    return _textbooks.length;
  }

  void addTextBook(String newTextBookTitle, int newTextBookNumber , int newAchieveNumber ){

    var textbook = TextBook(name: newTextBookTitle, number: newTextBookNumber, achievenumber: newAchieveNumber);
    _textbooks.add(textbook);
    notifyListeners();
  }

  void deleteTextBook(TextBook textbook) {
    _textbooks.remove(textbook);
    notifyListeners();
  }

  void updateAchieveNumber(int index, int newachievenumber){
    _textbooks[index].achievenumber = newachievenumber;
    notifyListeners();
  }

}