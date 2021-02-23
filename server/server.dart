import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  /** TODO:
    Replace <password> with the password for the admin user. 
    Replace <myFirstDatabase> with the name of the database that connections will use by default.
    Replace <myCluster> with the name of your cluster.
    Ensure any option params are URL encoded.
   */
  final db = await Db.create(
      'mongodb+srv://admin:<password>@<myCluster>.pzfw9.mongodb.net/<myFirstDatabase>?retryWrites=true&w=majority');

  await db.open();

  final faqCollection = db.collection('FAQ');
  final articuloCollection = db.collection('Articulo');
  final notificacionCollection = db.collection('Notificacion');

  print(await notificacionCollection.find().toList());
}
