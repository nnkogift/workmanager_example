import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("Task $task is running");
    print("inputData: $inputData");
    return Future.value(true);
  });
}

class WorkManagerService {
  init() {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    Workmanager().registerOneOffTask("init task", "task");
  }

  scheduleTask(int? frequency) {
    if (frequency != null) {
      Workmanager().registerPeriodicTask(
        'periodic_task',
        'periodic_task',
        initialDelay: Duration(minutes: frequency),
        frequency: Duration(minutes: frequency),
      );
    }
  }
}
