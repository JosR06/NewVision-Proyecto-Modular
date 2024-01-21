// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'mothership/settings_page.dart';
import 'mothership/image_process.dart';

List<CameraDescription>? cameras;
void main() async {
  Gemini.init(apiKey: 'AIzaSyAcQHWJKH0nIGlrstOsOrzrc_-YnfWG9kw');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());
  cameras = await availableCameras();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({super.key, required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePage(),
      // rest of your code
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Home page Widget
class _HomePageState extends State<_HomePage> {
  int _selectedIndex = 1;
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras![0], ResolutionPreset.ultraHigh);
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      ).then((_) => setState(() {
          _selectedIndex = 0; // reset to home page
        }));
    }
      if (index == 1) {
        _initializeCamera();
      } else {
        _controller?.dispose();
        _controller = null;
      }
    });
  }

  void _initializeCamera() {
    _controller = CameraController(cameras![0], ResolutionPreset.ultraHigh);
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vysion'),
      ),
      body: _selectedIndex == 1
          ? (!_controller!.value.isInitialized
              ? Container()
              : AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: CameraPreview(_controller!)))
          : (_selectedIndex == 0
              ? const Text('Read Page')
              : const Text('Profile Page')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_outlined),
            label: 'Read',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(0, 15, 243, 1),
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
