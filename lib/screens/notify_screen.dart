import 'package:flutter/material.dart';

class NotifyScreen extends StatefulWidget {
  static const id = '/notify';
  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: Center(
        child: Text('Notify'),
      ),
    );
  }
}
