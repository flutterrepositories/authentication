import 'package:authentication/src/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class DeleteUserButton extends StatelessWidget {
  final AuthenticationRepository _repository = AuthenticationRepository();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Cancella utente',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: const Size.fromHeight(30),
          textStyle: TextStyle(
            color: Colors.white,
          )),
      onPressed: () {
        showDialog(
            context: context,
            builder: (bc) {
              return AlertDialog(
                title: Text("Sei sicuro?"),
                content: Text(
                    "Se sei sicuro di voler cancellare il tuo utente?"),
                actions: <Widget>[
                  TextButton(
                    child: Text("Sí, Grazie!",
                    style: TextStyle(color: Colors.red.shade700)),
                    onPressed: () {
                      _repository.deleteUser().then((value) {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      });
                    },
                  ),
                  TextButton(
                    child: Text("No! Mi piace Schedina!"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
    );
  }
}
