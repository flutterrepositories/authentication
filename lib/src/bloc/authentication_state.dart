part of 'authentication_bloc.dart';

// ignore: must_be_immutable
class AuthenticationState extends Equatable {
  AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, required this.userID});

  AuthenticationState.unknown() : this._(userID: '');

  AuthenticationState.error() : this._(userID: '');

  AuthenticationState.authenticating() : this._(userID: '');

  AuthenticationState.authenticated(String userID)
      : this._(status: AuthenticationStatus.authenticated, userID: userID);

  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated, userID: '');

  final AuthenticationStatus status;
  String userID = '';

  @override
  List<Object> get props => [status];
}
