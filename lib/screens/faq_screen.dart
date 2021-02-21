import 'package:bobi_app/screens/faq_screen_modification.dart';
import 'package:flutter/material.dart';

import 'package:bobi_app/models/faq.dart';
import 'package:bobi_app/components/faq_tile.dart';

class FAQScreen extends StatefulWidget {
  static const id = '/FAQ';
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> faqs = [
    FAQ(
        pregunta: '¿Cuál es la mejor forma de comprar tus producstos?',
        respuesta: 'Utilizando mi página web, www.cooltech.com'),
    FAQ(
        pregunta: '¿Cuál es la mejor forma de comprar tus producstos?',
        respuesta: 'Utilizando mi página web, www.cooltech.com'),
    FAQ(
        pregunta: '¿Cuál es la mejor forma de comprar tus producstos?',
        respuesta: 'Utilizando mi página web, www.cooltech.com'),
    FAQ(
        pregunta: '¿Cuál es la mejor forma de comprar tus producstos?',
        respuesta: 'Utilizando mi página web, www.cooltech.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var faq =
              await Navigator.pushNamed(context, FAQScreenModification.id);
          setState(() {
            if (faq != null) {
              faqs.add(faq);
              //TODO: Tendriamos que guardar aqui el nuevo faq en la BD
            }
          });
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('FAQ eliminado')));
                setState(() {
                  faqs.removeAt(index);
                });
              },
              background: Container(
                color: Colors.deepPurpleAccent,
              ),
              child: FAQTile(
                  preguntaTile: faqs[index].pregunta,
                  respuestaTile: faqs[index].respuesta),
            );
          },
        ),
      ),
    );
  }
}
