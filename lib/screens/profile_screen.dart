import 'package:flutter/material.dart';
import 'package:bobi_app/components/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen(this.logoutAction, this.name, this.picture);

  //static const id = '/profile';
  final Function logoutAction;
  final String name;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            picture == null || picture == ''
                ? CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                    radius: 50,
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(picture),
                    radius: 50,
                  ),
            SizedBox(height: 20.0),
            name == null ? Text('Nombre: usuario') : Text('Nombre: $name'),
            CustomButton(textString: 'Cerrar sesion', onPress: logoutAction),
          ],
        ),
      ),
    );
  }
}
