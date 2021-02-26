import 'package:bobi_app/screens/inventory_screen_modification.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/models/inventory.dart';
import 'package:bobi_app/server.dart' as server;

class InventoryTile extends StatefulWidget {
  InventoryTile(Inventory inventory) {
    this.articuloTile = inventory.getNombreArticulo();
    this.cantidadTile = inventory.getCantidad().toString();
    this.inventory = inventory;
  }
  Inventory inventory;
  String articuloTile;
  String cantidadTile;

  @override
  _InventoryTileState createState() => _InventoryTileState();
}

class _InventoryTileState extends State<InventoryTile> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () async {
        var inventoryModificado = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InventoryScreenModification(
              preguntaInputDecoration: kTextFieldInputPreguntaDecoration
                  .copyWith(hintText: widget.articuloTile),
              respuestaInputDecoration: kTextFieldInputRespuestaDecoration
                  .copyWith(hintText: widget.cantidadTile),
            ),
          ),
        );

        if (inventoryModificado != null) {
          Inventory inventoryConvertido = inventoryModificado;
          setState(() {
            widget.articuloTile = inventoryConvertido.getNombreArticulo();
            widget.cantidadTile = inventoryConvertido.getCantidad().toString();
          });
          server.modificarInventory(
              widget.inventory.getObjectId(),
              inventoryConvertido.getNombreArticulo(),
              inventoryConvertido.getCantidad());
        }
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          color: kFeatureExplanationColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Articulo: ${widget.articuloTile}'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Cantidad: ${widget.cantidadTile}',
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
