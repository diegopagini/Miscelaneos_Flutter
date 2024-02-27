import 'package:miscelaneos/config/plugins/share_preferences_plugin.dart';
import 'package:miscelaneos/config/workmanager/callback_dispatcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workmanager/workmanager.dart';

part 'background_tasks_provider.g.dart';

@riverpod
class BackgroundTasks extends _$BackgroundTasks {
  final String processKeyName;

  BackgroundTasks({this.processKeyName = fetchPeriodicBagrkoundTaskKey})
      : super() {
    checkCurrentStatus();
  }

  @override
  bool build() => false;

  Future<void> checkCurrentStatus() async {
    state = await SharePreferencesPlugin.getBool(processKeyName);
  }

  void toggleProcess() {
    state == true ? deactivateProcess() : activateProcess();
  }

  Future<void> activateProcess() async {
    await Workmanager().registerPeriodicTask(processKeyName, processKeyName,
        frequency: const Duration(minutes: 15),
        constraints: Constraints(networkType: NetworkType.connected),
        tag: processKeyName);

    await SharePreferencesPlugin.setBool(processKeyName, true);
    state = true;
  }

  Future<void> deactivateProcess() async {
    await Workmanager().cancelByTag(
      processKeyName,
    );

    await SharePreferencesPlugin.setBool(processKeyName, false);
    state = false;
  }
}
