class Inventory {
  String articulo;
  int cantidad;

  Inventory({this.articulo, this.cantidad});

  String getArticulo() {
    return this.articulo;
  }

  int getCantidad() {
    return this.cantidad;
  }
}
