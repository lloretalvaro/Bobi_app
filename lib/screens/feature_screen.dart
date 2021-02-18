import 'package:bobi_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/components/feature_row.dart';
import 'faq_screen.dart';
import 'notify_screen.dart';
import 'inventory_screen.dart';

class FeatureScreen extends StatelessWidget {
  //TODO: Aqui tendriamos que pasarle el token
  // como parametro al constructor de FeatureScreen y
  // al resto de pantallas por debajo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(() {}, 'Pepito', null)));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              FeatureRow(
                buttonIcon: Icons.question_answer_rounded,
                buttonText: 'Ver FAQ',
                buttonOnPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FAQScreen()));
                },
                explanationFeatureText:
                    'Añade las preguntas mas típicas que hagan tus clientes',
              ),
              FeatureRow(
                buttonIcon: Icons.notifications,
                buttonText: 'Ver Avisos',
                buttonOnPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotifyScreen()));
                },
                explanationFeatureText:
                    'Avisa a tus clientes sobre nuevos productos, ofertas, eventos... ',
              ),
              FeatureRow(
                buttonIcon: Icons.inventory,
                buttonText: 'Ver Gestion',
                buttonOnPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryScreen()));
                },
                explanationFeatureText:
                    'Gestiona tu inventario de forma sencilla y rápida!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
