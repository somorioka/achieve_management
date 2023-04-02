import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/textbook_data.dart';
import 'screens/textbooks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TextBookData(),
      child: MaterialApp(
        home:  TextBooksScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

