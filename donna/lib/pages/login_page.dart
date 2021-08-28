import 'package:donna/services/authentication_service.dart';
import 'package:donna/pages/home.dart';
import 'package:donna/pages/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return Center(child: Text('Algo salió mal'),);
          } else {
            return SignInPage();
          }
        },
      )
    );
  }
}