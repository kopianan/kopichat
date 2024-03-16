import 'package:flutter/material.dart';
import 'package:kopichat/injectable.dart';
import 'package:kopichat/presentation/app.dart';
import 'package:kopichat/firebase_options.dart'; 
import 'package:firebase_core/firebase_core.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(  App());
}
