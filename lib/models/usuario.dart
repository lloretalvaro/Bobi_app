import 'dart:convert';

class Usuario {
  Usuario(jsonUsuario) {
    Map userMap = jsonDecode(jsonUsuario);
    this.nombre = userMap['name'];
  }

  String nombre;
  String getNombre() {
    return this.nombre;
  }
}
