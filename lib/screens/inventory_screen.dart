import 'package:bobi_app/models/inventory.dart';
import 'package:flutter/material.dart';

import 'inventory_screen_modification.dart';
import 'package:bobi_app/components/inventory_tile.dart';
import 'package:bobi_app/server.dart' as server;

class InventoryScreen extends StatefulWidget {
  static const id = '/inventory';
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Inventory> inventoryList = [];

  Future<void> pillarInventory() async {
    inventoryList = await server.getAllInventory();
  }

  dynamic subirArticulo(Inventory inventoryConverted) async {
    return await server.guardarArticulo(inventoryConverted.getNombreArticulo(),
        inventoryConverted.getCantidad());
  }

  void borrarArticulo(Inventory inventory) async {
    await server.eliminarArticulo(inventory.getObjectId());
  }

  Scaffold inventoryScreenBody() {
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
              Inventory inventoryConverted = inventory;
              inventoryList.add(inventoryConverted);

              dynamic objectId = subirArticulo(inventoryConverted);

              inventoryConverted.setObjectId(objectId);
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
                  borrarArticulo(inventoryList[index]);
                  inventoryList.removeAt(index);
                });
              },
              background: Container(
                color: Colors.red,
              ),
              child: InventoryTile(
                inventoryList[index],
              ),
            );
          },
        ),
      ),
    );
  }

  Scaffold safeProgressIndicator() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pillarInventory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return safeProgressIndicator();
            case ConnectionState.waiting:
              return safeProgressIndicator();
            case ConnectionState.done:
              return inventoryScreenBody();

            default:
              if (snapshot.hasData) {
                return inventoryScreenBody();
              } else {
                return safeProgressIndicator();
              }
          }
        });
  }
}
