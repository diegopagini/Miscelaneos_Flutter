// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$canCheckBiometricsHash() =>
    r'e74eb1a79f3e03b01749f8ea73d0cd1a00503702';

/// See also [canCheckBiometrics].
@ProviderFor(canCheckBiometrics)
final canCheckBiometricsProvider = FutureProvider<bool>.internal(
  canCheckBiometrics,
  name: r'canCheckBiometricsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canCheckBiometricsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CanCheckBiometricsRef = FutureProviderRef<bool>;
String _$localAuthStateHash() => r'4d61344fa08f9facce9aa257bc6f0f9ff2986e1e';

/// See also [LocalAuthState].
@ProviderFor(LocalAuthState)
final localAuthStateProvider =
    NotifierProvider<LocalAuthState, LocalAuthState>.internal(
  LocalAuthState.new,
  name: r'localAuthStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localAuthStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalAuthState = Notifier<LocalAuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
