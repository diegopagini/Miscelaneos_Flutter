import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    //simpleTask will be emitted here.
    print("Native: called background task: $task");
    return Future.value(true);
  });
}
