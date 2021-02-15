import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  //static const id = '/profile';
  final logoutAction;
  final String name;
  final String picture;

  ProfileScreen(this.logoutAction, this.name, this.picture);

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
            SizedBox(height: 24.0),
            name == null ? Text('Nombre: usuario') : Text('Nombre: $name'),
            SizedBox(height: 48.0),
            RaisedButton(
              onPressed: () {
                logoutAction();
              },
              child: Text('Cerrar session'),
            ),
          ],
        ),
      ),
    );
  }
}
