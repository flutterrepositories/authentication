import 'dart:async';

import 'package:bloc/bloc.dart';
import '../repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.unauthenticated()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onLogoutRequested);
    on<AuthenticationDeletionRequested>(_onDeletionRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) {
        print(status);
        this.add(AuthenticationStatusChanged(status));
      },
    );
  }

  late final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  FutureOr<void> _onLogoutRequested(AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit) async {
    _authenticationRepository.logOut();
  }

  FutureOr<void> _onDeletionRequested(AuthenticationDeletionRequested event,
      Emitter<AuthenticationState> emit) async {
    _authenticationRepository.deleteUser();
  }

  Future<void> _onAuthenticationStatusChanged(AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        emit(AuthenticationState.unauthenticated());
        break;

      case AuthenticationStatus.authenticated:
        emit(AuthenticationState.authenticated(
            _authenticationRepository.userId ?? ''));
        break;

      case AuthenticationStatus.authenticating:
        emit(AuthenticationState.authenticating());
        break;

      case AuthenticationStatus.error:
        emit(AuthenticationState.error());
        break;
      default:
        emit(AuthenticationState.unknown());
    }
  }
}
