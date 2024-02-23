import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/badge/badge_counter_provider.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(badgeCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bade'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Badge(
            alignment:
                Alignment.lerp(Alignment.topRight, Alignment.bottomRight, 0.2),
            label: Text('$counter'),
            child: Text(
              '$counter',
              style: const TextStyle(fontSize: 150),
            ),
          ),
          FilledButton.tonal(
              onPressed: () {
                ref.read(badgeCounterProvider.notifier).invalidate();
                AppBadgePlugin.removeBadge();
              },
              child: const Text('Borrar Badge'))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(badgeCounterProvider.notifier).update();
          AppBadgePlugin.updateBadgeCount(counter + 1);
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
