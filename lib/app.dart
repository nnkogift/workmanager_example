import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workmanager_example/work_manager.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController periodicTaskController = TextEditingController();
  int frequency = 15;

  @override
  Widget build(BuildContext context) {
    Timer(Duration(minutes: 1), () {
      if (frequency > 0) {
        setState(() {
          --frequency;
        });
      } else {
        setState(() {
          frequency = 15;
        });
      }
    });
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Work Manager Example'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 50.0, bottom: 20.0),
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    Text("$frequency",
                        style: TextStyle(
                            fontSize: 120, fontWeight: FontWeight.bold)),
                    Text(
                      "minutes",
                      style: TextStyle(fontSize: 24),
                    )
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: periodicTaskController,
                decoration: const InputDecoration(
                  labelText: 'Duration (minutes)',
                ),
                onChanged: (String value) {},
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Set Periodic Task'),
                onPressed: () {
                  final int? frequency =
                      int.tryParse(periodicTaskController.text);

                  setState(() {
                    this.frequency = frequency ?? 15;
                  });
                  WorkManagerService().scheduleTask(frequency);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
