import 'package:donna/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Donna'),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.signOut();
            }, 
            icon: FaIcon(FontAwesomeIcons.powerOff, color: Colors.white,), 
            label: Text('Salir', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Perfil', style: TextStyle(fontSize: 24, color: Colors.white),),
            SizedBox(height: 20,),
            CircleAvatar(
              radius: 50,
              backgroundImage: user.photoURL != null? 
              NetworkImage(user.photoURL!): 
              NetworkImage("https://logowik.com/content/uploads/images/flutter5786.jpg")
            ),
            SizedBox(height: 8,),
            Text(
              (user.displayName != null ? 'Nombre: ' + user.displayName! : ''),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              'Email: ' + user.email!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}