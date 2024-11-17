import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const methodChannel(),
    );
  }
}

class methodChannel extends StatefulWidget {
  const methodChannel({super.key});

  @override
  State<methodChannel> createState() => _methodChannelState();
}
   const platform = MethodChannel('Narendra');
String name = 'unknown';


class _methodChannelState extends State<methodChannel> {
  // String _batteryLevel = 'Unknown battery level.';

Future<void> _getchannelData() async {
  String batteryLevel;
  try {
    final result = await platform.invokeMethod<String>('getMyEmail');
    batteryLevel = 'Battery level at $result % .';
  } on PlatformException catch (e) {
    batteryLevel = "Failed to get battery level: '${e.message}'.";
  }

  setState(() {
    name = batteryLevel;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("value of number is given >>> $name"),
          Center(
            child: TextButton(onPressed: () {_getchannelData();}, child: Text("press")),
          )
        ],
      ),
    );
  }
}
