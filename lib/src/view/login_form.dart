import 'package:authentication/authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutterfire_ui/auth.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  // Function onSignIn;
  final AuthenticationRepository _repository = AuthenticationRepository();
  //prod
  var webGoogleID =
      "361359267110-4omjq2ovd4ts46tnse2oljnsu70trl5c.apps.googleusercontent.com";
  var iosGoogleID =
      "361359267110-n7juudgm4asfvhnb16e25jbsaotrs0mm.apps.googleusercontent.com";
  // var iosGoogleID =
  //     "777426915671-30sdfmtdc6qcg2la0d0m837gtsbmngo6.apps.googleusercontent.com";
  var androidGoogleDebugID =
      "361359267110-4omjq2ovd4ts46tnse2oljnsu70trl5c.apps.googleusercontent.com";
  var androidGoogleID =
      "361359267110-4omjq2ovd4ts46tnse2oljnsu70trl5c.apps.googleusercontent.com";
  var facebookID = "158376391379190";

  Widget header;
  LoginForm({required this.header});

  @override
  Widget build(BuildContext context) {
    var gid = getGoogleID();
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

  String getGoogleID() {
    if (Platform.isIOS) {
      return iosGoogleID;
    } else if (Platform.isAndroid && kDebugMode) {
      return androidGoogleDebugID;
    } else if (Platform.isAndroid) {
      return androidGoogleID;
    } else {
      return webGoogleID;
    }
  }
}
