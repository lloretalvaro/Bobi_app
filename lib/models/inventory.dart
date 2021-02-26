import 'package:mongo_dart/mongo_dart.dart';

class Inventory {
  String articulo;
  int cantidad;
  ObjectId id;

  Inventory({this.articulo, this.cantidad});

  String getArticulo() {
    return this.articulo;
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
