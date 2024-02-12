// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonByIdHash() => r'2d5bbe85ab66cf950fb32b033636083ca5ec2be2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pokemonById].
@ProviderFor(pokemonById)
const pokemonByIdProvider = PokemonByIdFamily();

/// See also [pokemonById].
class PokemonByIdFamily extends Family<AsyncValue<Pokemon>> {
  /// See also [pokemonById].
  const PokemonByIdFamily();

  /// See also [pokemonById].
  PokemonByIdProvider call(
    String id,
  ) {
    return PokemonByIdProvider(
      id,
    );
  }

  @override
  PokemonByIdProvider getProviderOverride(
    covariant PokemonByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonByIdProvider';
}

/// See also [pokemonById].
class PokemonByIdProvider extends FutureProvider<Pokemon> {
  /// See also [pokemonById].
  PokemonByIdProvider(
    String id,
  ) : this._internal(
          (ref) => pokemonById(
            ref as PokemonByIdRef,
            id,
          ),
          from: pokemonByIdProvider,
          name: r'pokemonByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonByIdHash,
          dependencies: PokemonByIdFamily._dependencies,
          allTransitiveDependencies:
              PokemonByIdFamily._allTransitiveDependencies,
          id: id,
        );

  PokemonByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Pokemon> Function(PokemonByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PokemonByIdProvider._internal(
        (ref) => create(ref as PokemonByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Pokemon> createElement() {
    return _PokemonByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PokemonByIdRef on FutureProviderRef<Pokemon> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PokemonByIdProviderElement extends FutureProviderElement<Pokemon>
    with PokemonByIdRef {
  _PokemonByIdProviderElement(super.provider);

  @override
  String get id => (origin as PokemonByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
