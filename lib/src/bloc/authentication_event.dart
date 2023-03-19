part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationDeletionRequested extends AuthenticationEvent {
  const AuthenticationDeletionRequested();

  @override
  List<Object> get props => [];
}

class AuthenticationError extends AuthenticationEvent {}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
