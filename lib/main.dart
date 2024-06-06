import 'package:channelmethod/file%20handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:isolate';
import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSV File Downloader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      int status = data[1];
      int progress = data[2];

      if (status == DownloadTaskStatus.running) {
        print("Download in progress: $progress%");
      } else if (status == DownloadTaskStatus.complete) {
        print("Download complete");
        _openDownloadedFile(id);
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(
      String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  Future<void> _downloadAndOpenCSV() async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      return;
    }

    // Get directory to save the file
    var directory = await getExternalStorageDirectory();
    String filePath = "${directory!.path}/downloaded_file.csv";

    // Download the file
    final taskId = await FlutterDownloader.enqueue(
      url: 'https://org-id.guide/download.csv', // Provided CSV URL
      savedDir: directory.path,
      fileName: 'downloaded_file.csv',
      showNotification: true, // Show download progress in status bar (for Android)
      openFileFromNotification: true, // Click on notification to open file (for Android)
    );
  }

  Future<void> _openDownloadedFile(String taskId) async {
    final tasks = await FlutterDownloader.loadTasksWithRawQuery(query: "SELECT * FROM task WHERE task_id = '$taskId'");
    if (tasks != null && tasks.isNotEmpty) {
      final task = tasks.first;
      final filePath = '${task.savedDir}/${task.filename}';
      await MethodChannelHandler.openCSVFile(filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSV File Downloader"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _downloadAndOpenCSV,
          child: Text("Download and Open CSV"),
        ),
      ),
    );
  }
}
