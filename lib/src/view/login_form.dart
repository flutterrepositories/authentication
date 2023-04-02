import 'package:authentication/authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutterfire_ui/auth.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  // Function onSignIn;
  final AuthenticationRepository _repository = AuthenticationRepository();

  Widget header;
  String googleID;
  String facebookID;
  LoginForm({required this.header, required this.googleID});

  @override
  Widget build(BuildContext context) {
    var gid = googleID;
    FlutterFireUIAuth.configureProviders([
      GoogleProviderConfiguration(clientId: gid),
      FacebookProviderConfiguration(clientId: facebookID),
      AppleProviderConfiguration(),
    ]);

    return SignInScreen(
      headerBuilder: (context, constraints, shrinkOffset) {
        return Container(
          padding: EdgeInsets.only(top: 20),
          child: header,
        );
      },
      showAuthActionSwitch: false,
      // footerBuilder: (context, action) {
      //   return Container(
      //     padding: EdgeInsets.only(bottom: 20),
      //     child: Text("Google ID: $gid"),
      //   );
      // },
    );
  }
}
