import 'package:bobi_app/screens/inventory_screen_modification.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/models/inventory.dart';

class InventoryTile extends StatefulWidget {
  InventoryTile({@required this.articuloTile, @required this.cantidadTile});

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
        var inventory = await Navigator.push(
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

        if (inventory != null) {
          setState(() {
            Inventory inventoryConvertido = inventory;
            widget.articuloTile = inventoryConvertido.getArticulo();
            widget.cantidadTile = inventoryConvertido.getCantidad().toString();
          });
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
