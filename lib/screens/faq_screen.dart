import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  static const id = '/FAQ';
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: Center(
        child: Text('FAQ'),
      ),
    );
  }
}
