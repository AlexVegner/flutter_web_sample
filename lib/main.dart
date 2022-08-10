import 'package:flutter/material.dart';
import 'package:web_app/app.dart';
import 'package:web_app/common/config/configure_nonweb.dart'
    if (dart.library.html) 'package:web_app/common/config/configure_web.dart';
import 'package:web_app/common/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureApp();
  setupInjections();

  runApp(const App());
}
