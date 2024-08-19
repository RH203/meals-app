import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/src/app.dart';
import 'package:meals_app/src/injection/injection.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const App());
}
