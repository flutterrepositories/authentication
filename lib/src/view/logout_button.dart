import 'package:authentication/src/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  final AuthenticationRepository _repository = AuthenticationRepository();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Logout',
          style: TextStyle(
            color: Colors.white,
          )),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(30),
          textStyle: TextStyle(
            color: Colors.white,
          )),
      onPressed: () {
        _repository.logOut();
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }
}
