import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    'com.diegopagini.miscelaneos.fetch-background-pokemon';
const fetchPeriodicBagrkoundTaskKey =
    'com.diegopagini.miscelaneos.fetch-background-periodic';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        print('fetchBackgroundTaskKey');
        break;

      case fetchPeriodicBagrkoundTaskKey:
        print('fetchPeriodicBagrkoundTaskKey');
        break;

      case Workmanager.iOSBackgroundTask: // FOR IOS
        print('Workmanager.iOSBackgroundTask');
        break;
    }

    return true;
  });
}
