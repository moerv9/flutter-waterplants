import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'plant_route.dart';
import 'settings_route.dart';
import 'third_route.dart';
import 'camera_route.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(
    camera: firstCamera,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Demo',
      initialRoute: '/',
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(child: Text('Not found')),
              )),
      routes: {
        '/': (context) => const PlantRoute(),
        '/sprossen': (context) => const SprossenRoute(),
        '/settings': (context) => const SettingsRoute(),
        '/camera': (context) => TakePictureScreen(camera: camera),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
