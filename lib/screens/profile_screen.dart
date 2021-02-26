import 'package:flutter/material.dart';
import 'package:bobi_app/components/buttons/custom_button.dart';
import 'package:bobi_app/models/usuario.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen(Function logoutAction, Usuario usuario) {
    this.logoutAction = logoutAction;
    this.name = usuario.getNombre();
  }

  //static const id = '/profile';
  Function logoutAction;
  String name;
  String picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
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
              CustomButton(
                  textString: 'Cerrar sesion',
                  onPress: () {
                    logoutAction();
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName('/'),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
