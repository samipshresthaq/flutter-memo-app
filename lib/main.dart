import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() => runApp(MemoApp());

// Main app widget
class MemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo',
      theme: ThemeData.dark(),
      home: Home(),
      debugShowCheckedModeBanner: false
    );
  }
}
