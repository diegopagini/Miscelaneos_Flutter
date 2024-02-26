import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/ads/admod_providers.dart';

class AdFullScreen extends ConsumerWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstitialAdAsync = ref.watch(adInterstitialProviderProvider);

    ref.listen(adInterstitialProviderProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show();
    });

    if (interstitialAdAsync.isLoading) {
      return const Scaffold(body: Center(child: Text('Loading...')));
    }

    // if (interstitialAdAsync.hasValue) {
    //   interstitialAdAsync.value!.show();
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Scren'),
      ),
      body: const Center(
        child: Text('Ya puedes regresar o ver esta pantalla'),
      ),
    );
  }
}
