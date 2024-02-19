import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static availableBiometrics() async {
    final List<BiometricType> availableBiometris =
        await auth.getAvailableBiometrics();

    if (availableBiometris.isNotEmpty) {
      // Some code here
    }

    if (availableBiometris.contains(BiometricType.strong) ||
        availableBiometris.contains(BiometricType.face)) {
      // Some code here
    }
  }

  static Future<bool> canChekBiometris() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate(
      {bool biometricOnly = false}) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Por favor autenticate para continuar',
          options: AuthenticationOptions(biometricOnly: biometricOnly));

      return (
        didAuthenticate,
        didAuthenticate ? 'Hecho' : 'Cancelado por usuario'
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        return (false, 'No hay biométricos enrolados.');
      }

      if (e.code == auth_error.lockedOut) {
        return (false, 'Muchos intentos fallidos.');
      }

      if (e.code == auth_error.notAvailable) {
        return (false, 'No hay biométricos disponibles.');
      }

      if (e.code == auth_error.passcodeNotSet) {
        return (false, 'No hay pin configurado.');
      }

      if (e.code == auth_error.permanentlyLockedOut) {
        return (false, 'Se requiere desbloquear el teéfono.');
      }

      return (false, '$e');
    }
  }
}
