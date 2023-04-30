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
  LoginForm(
      {required this.header, required this.googleID, required this.facebookID});

  @override
  Widget build(BuildContext context) {
    var gid = googleID;
    List<ProviderConfiguration> providers =
        List<ProviderConfiguration>.empty(growable: true);

    if (gid.isNotEmpty) {
      providers.add(GoogleProviderConfiguration(clientId: gid));
    }

    if (facebookID.isNotEmpty) {
      providers.add(FacebookProviderConfiguration(clientId: facebookID));
    }

    if (!kIsWeb) {
      if (Platform.isIOS) {
        providers.add(AppleProviderConfiguration());
      }
    }

    FlutterFireUIAuth.configureProviders(providers);

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
