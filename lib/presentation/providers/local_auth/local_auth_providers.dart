import 'package:miscelaneos/config/plugins/local_auth_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_providers.g.dart';

@Riverpod(keepAlive: true)
Future<bool> canCheckBiometrics(
  CanCheckBiometricsRef ref,
) async {
  return await LocalAuthPlugin.canChekBiometris();
}

enum LocalAuthStatus { authenticated, notAuthenticated, authenticating }

@Riverpod(keepAlive: true)
class LocalAuthState extends _$LocalAuthState {
  final bool didAunthenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState(
      {this.didAunthenticate = false,
      this.status = LocalAuthStatus.notAuthenticated,
      this.message = ''});

  @override
  LocalAuthState build() => LocalAuthState();

  LocalAuthState copyWith(
          {bool? didAunthenticate, LocalAuthStatus? status, String? message}) =>
      LocalAuthState(
          didAunthenticate: didAunthenticate ?? this.didAunthenticate,
          status: status ?? this.status,
          message: message ?? this.message);

  Future<(bool, String)> authenticateUser() async {
    final (didAunthenticate, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
        didAunthenticate: didAunthenticate,
        message: message,
        status: didAunthenticate
            ? LocalAuthStatus.authenticated
            : LocalAuthStatus.notAuthenticated);

    return (didAunthenticate, message);
  }

  @override
  String toString() {
    return ''' 
    didAunthenticate: $didAunthenticate,
    status: $status,
    message: $message,
    ''';
  }
}
