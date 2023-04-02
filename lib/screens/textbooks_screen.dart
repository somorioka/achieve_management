import 'package:achieve_management/models/textbook_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/textbooks_list.dart';
import 'add_textbook_screen.dart';
import 'piechart_screen.dart';

class TextBooksScreen extends StatelessWidget {
  const TextBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTextBookScreen(),
          );
        },
        backgroundColor: Color.fromARGB(255, 103, 202, 77),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.0),
        child: AppBar(
          title: const Text("やり切る教材",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          backgroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      body: TextBookList(),
    );
  }
}
