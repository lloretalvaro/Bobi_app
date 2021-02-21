import 'package:bobi_app/models/inventory.dart';
import 'package:flutter/material.dart';
import 'inventory_screen_modification.dart';
import 'package:bobi_app/components/inventory_tile.dart';

class InventoryScreen extends StatefulWidget {
  static const id = '/inventory';
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Inventory> inventoryList = [
    Inventory(articulo: 'Samsung S21', cantidad: 9),
    Inventory(articulo: 'Samsung S21', cantidad: 9),
    Inventory(articulo: 'Samsung S21', cantidad: 9),
    Inventory(articulo: 'Samsung S21', cantidad: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var inventory = await Navigator.pushNamed(
              context, InventoryScreenModification.id);
          setState(() {
            if (inventory != null) {
              inventoryList.add(inventory);
              //TODO: Tendriamos que guardar aqui el nuevo inventario en la BD
            }
          });
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: inventoryList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Articulo eliminado')));
                setState(() {
                  inventoryList.removeAt(index);
                });
              },
              background: Container(
                color: Colors.deepPurpleAccent,
              ),
              child: InventoryTile(
                  articuloTile: inventoryList[index].articulo,
                  cantidadTile: inventoryList[index].cantidad.toString()),
            );
          },
        ),
      ),
    );
  }
}
