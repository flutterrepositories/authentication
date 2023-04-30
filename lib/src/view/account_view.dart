import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ui/ui.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return view(context);
  }

  void onPressOfButton() {
    FirebaseAuth.instance.signOut();
  }

  Widget view(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      return Container(
        child: Center(
          child: Text('Please login'),
        ),
      );
    }

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CardStack(
                      color: Colors.white,
                      content: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FittedBox(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  firebaseUser.displayName != null
                                      ? Text(firebaseUser.displayName!,
                                          style: TextStyle(fontSize: 40.0))
                                      : Text('-'),
                                  firebaseUser.photoURL != null
                                      ? Image.network(
                                          firebaseUser.photoURL!,
                                          height: 100.0,
                                          width: 100.0,
                                        )
                                      : Text(""),
                                ]),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10.0),
                child: DeleteUserButton()),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10.0),
                child: LogOutButton()),
            Padding(padding: EdgeInsets.all(10.0)),
          ],
        ),
      ),
    );
  }
}
