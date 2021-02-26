import 'package:bobi_app/models/inventory.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/components/custom_button.dart';

class InventoryScreenModification extends StatefulWidget {
  static const id = '/inventorymodification';

  InventoryScreenModification(
      {this.preguntaInputDecoration, this.respuestaInputDecoration});
  final InputDecoration preguntaInputDecoration;
  final InputDecoration respuestaInputDecoration;

  @override
  _InventoryScreenModificationState createState() =>
      _InventoryScreenModificationState();
}

class _InventoryScreenModificationState
    extends State<InventoryScreenModification> {
  String articulo;
  int cantidad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Artículo que quieres añadir',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: widget.preguntaInputDecoration ??
                      kTextFieldInputPreguntaDecoration.copyWith(
                          hintText: 'Inserta tu artículo...'),
                  onChanged: (value) => articulo = value,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Cantidad del artículo',
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: widget.respuestaInputDecoration ??
                      kTextFieldInputRespuestaDecoration.copyWith(
                          hintText: 'Inserta la cantidad...'),
                  onChanged: (value) {
                    try {
                      cantidad = int.parse(value);
                    } catch (e) {
                      cantidad = -1;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                    textString: 'Añadir',
                    onPress: () {
                      Inventory inventory;
                      if (cantidad != null &&
                          cantidad != -1 &&
                          articulo != null &&
                          articulo != '') {
                        inventory =
                            Inventory(articulo: articulo, cantidad: cantidad);
                      }
                      Navigator.pop(context, inventory);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
