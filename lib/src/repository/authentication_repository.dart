import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthenticationStatus {
  unknown,
  error,
  authenticated,
  authenticating,
  unauthenticated
}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userId;

  Stream<AuthenticationStatus> get status async* {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        userId = null;
        _controller.add(AuthenticationStatus.unauthenticated);
      } else {
        userId = user.uid;
        _controller.add(AuthenticationStatus.authenticated);
      }
    });
    yield AuthenticationStatus.unknown;
    yield* _controller.stream;
  }

  void logOut() {
    _auth.signOut();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> deleteUser() async {
    var current = _auth.currentUser;
    if (current != null) {
      current.delete().then((value) => logOut());
    }
  }

  void dispose() => _controller.close();
}
