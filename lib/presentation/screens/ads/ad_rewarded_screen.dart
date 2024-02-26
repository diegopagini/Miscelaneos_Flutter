import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adRewardedAsync = ref.watch(adRewardedProviderProvider);
    final pointsProvider = ref.watch(admonPointsProvider);

    ref.listen(adRewardedProviderProvider, (prev, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show(onUserEarnedReward: (ad, reward) {
        ref.read(admonPointsProvider.notifier).update(reward.amount.toInt());
      });
    });

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('Loading...'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Scren'),
      ),
      body: Center(
        child: Text('Puntos actuales: $pointsProvider'),
      ),
    );
  }
}
