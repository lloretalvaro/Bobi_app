import 'package:bobi_app/screens/faq_screen_modification.dart';
import 'package:flutter/material.dart';

import 'package:bobi_app/models/faq.dart';
import 'package:bobi_app/components/faq_tile.dart';
import 'package:bobi_app/server.dart' as server;

class FAQScreen extends StatefulWidget {
  static const id = '/FAQ';
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> faqs = [];

  Future<void> pillarFAQS() async {
    faqs = await server.getAllFAQS();
  }

  dynamic subirFAQ(FAQ faqConverted) async {
    return await server.guardarFAQ(
        faqConverted.getPregunta(), faqConverted.getRespuesta());
  }

  void borrarFAQ(FAQ faq) async {
    await server.eliminarFAQ(faq.getObjectId());
  }

  Scaffold faqScreenBody() {
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
              FAQ faqConverted = faq;
              faqs.add(faqConverted);
              dynamic objectId = subirFAQ(faqConverted);
              faqConverted.setObjectId(objectId);
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
                  borrarFAQ(faqs[index]);
                  faqs.removeAt(index);
                });
              },
              background: Container(
                color: Colors.red,
              ),
              child: FAQTile(
                faqs[index],
              ),
            );
          },
        ),
      ),
    );
  }

  Scaffold safeProgressIndicator() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pillarFAQS(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return safeProgressIndicator();
            case ConnectionState.waiting:
              return safeProgressIndicator();
            case ConnectionState.done:
              return faqScreenBody();

            default:
              if (snapshot.hasData) {
                return faqScreenBody();
              } else {
                return safeProgressIndicator();
              }
          }
        });
  }
}
