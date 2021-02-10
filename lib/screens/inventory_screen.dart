import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  static const id = '/inventory';
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: Center(
        child: Text('Inventory'),
      ),
    );
  }
}
