import 'package:mongo_dart/mongo_dart.dart';
import 'package:http/http.dart' as http;
import 'models/faq.dart';
import 'models/inventory.dart';

Db db;

void iniciarServer() async {
  /** TODO:
    Replace <password> with the password for the admin user. 
    Replace <myFirstDatabase> with the name of the database that connections will use by default.
    Replace <myCluster> with the name of your cluster.
    Ensure any option params are URL encoded.
   */

  db = await Db.create(
      'mongodb+srv://admin:admin@clusterbobi.pzfw9.mongodb.net/BobiDB?retryWrites=true&w=majority');
  await db.open();
}

void guardarNotificacion(String textoNotificacion) async {
  var headers = {
    'Content-Type': 'application/json',
  };
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://eu-de.functions.appdomain.cloud/api/v1/web/8c03d399-b66f-458d-bdab-d35b4d507ee8/private/notification'));
  request.body = '''{"message": "$textoNotificacion"}''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

Future<ObjectId> guardarArticulo(String nombre, int cantidad) async {
  final collection = db.collection('Articulo');
  Map articuloMapa =
      await collection.insertOne({'nombre': nombre, 'cantidad': cantidad});
  return articuloMapa['insertedId'];
}

void eliminarArticulo(ObjectId objectId) async {
  final collection = db.collection('Articulo');
  await collection.remove(where.eq('_id', objectId));
}

Future<ObjectId> guardarFAQ(String pregunta, String respuesta) async {
  final collection = db.collection('FAQ');
  Map faqMapa = await collection
      .insertOne({'pregunta': pregunta, 'respuesta': respuesta});
  return faqMapa['insertedId'];
}

void eliminarFAQ(ObjectId objectId) async {
  final collection = db.collection('FAQ');
  await collection.remove(where.eq('_id', objectId));
}

FAQ decodeFAQ(mapaFAQ) {
  String pregunta = mapaFAQ['pregunta'];
  if (pregunta != 'horario' && pregunta != 'localizacion') {
    FAQ faq = FAQ(
        pregunta: pregunta,
        respuesta: mapaFAQ['respuesta'],
        id: mapaFAQ['_id']);

    return faq;
  } else {
    return null;
  }
}

Future<List<FAQ>> getAllFAQS() async {
  List<FAQ> faqs = [];
  final collection = db.collection('FAQ');

  List jsonFaqs = await collection.find().toList();

  for (var jsonFaq in jsonFaqs) {
    FAQ faq = decodeFAQ(jsonFaq);
    if (faq != null) {
      faqs.add(faq);
    }
  }

  return faqs;
}

List<Inventory> getAllInventory() {
  List<Inventory> inventoryList = [];
  return inventoryList;
}

/** 
  await notificacionCollection.remove(
      where.eq('_id', ObjectId.fromHexString("6038bbd8facb046e26499f4e")));
*/
