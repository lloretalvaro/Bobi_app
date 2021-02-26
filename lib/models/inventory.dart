import 'package:mongo_dart/mongo_dart.dart';

class Inventory {
  String nombre;
  int cantidad;
  ObjectId id;

  Inventory({this.nombre, this.cantidad, this.id});

  String getNombreArticulo() {
    return this.nombre;
  }

  int getCantidad() {
    return this.cantidad;
  }

  void setObjectId(objectId) async {
    this.id = await objectId;
  }

  ObjectId getObjectId() {
    return this.id;
  }
}
