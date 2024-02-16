import 'package:miscelaneos/config/plugins/local_auth_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_providers.g.dart';

@Riverpod(keepAlive: true)
Future<bool> canCheckBiometrics(
  CanCheckBiometricsRef ref,
) async {
  return await LocalAuthPlugin.canChekBiometris();
}
