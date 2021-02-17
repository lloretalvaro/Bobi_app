import 'package:flutter/material.dart';
import 'package:bobi_app/components/feature_row.dart';

class FeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              FeatureRow(
                buttonIcon: Icons.ac_unit,
                buttonText: 'NICE',
                buttonOnPress: () {},
              ),
              SizedBox(
                height: 50,
              ),
              FeatureRow(
                buttonIcon: Icons.ac_unit,
                buttonText: 'NICE',
                buttonOnPress: () {},
              ),
              SizedBox(
                height: 50,
              ),
              FeatureRow(
                buttonIcon: Icons.ac_unit,
                buttonText: 'NICE',
                buttonOnPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
