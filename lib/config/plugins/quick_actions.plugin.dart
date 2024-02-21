import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {
  static registerActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.initialize((type) {
      // Only 4 actions are allowed
      switch (type) {
        case 'biometric':
          break;

        case 'compass':
          break;

        case 'pokemons':
          break;

        case 'charmander':
          break;
      }
    });

    quickActions.setShortcutItems([
      const ShortcutItem(type: 'biometric', localizedTitle: 'Biometric'),
      const ShortcutItem(type: 'compass', localizedTitle: 'Compass'),
      const ShortcutItem(type: 'pokemons', localizedTitle: 'Pokemons'),
      const ShortcutItem(type: 'charmander', localizedTitle: 'Charmander'),
    ]);
  }
}
