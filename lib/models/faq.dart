import 'package:mongo_dart/mongo_dart.dart';

class FAQ {
  String pregunta;
  String respuesta;
  ObjectId id;

  FAQ({this.pregunta, this.respuesta, this.id});

  String getPregunta() {
    return this.pregunta;
  }

  String getRespuesta() {
    return this.respuesta;
  }

  void setObjectId(objectId) async {
    this.id = await objectId;
  }

  ObjectId getObjectId() {
    return this.id;
  }
}
