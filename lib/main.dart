import 'package:flutter/material.dart';
import 'package:kopichat/injectable.dart';
import 'package:kopichat/presentation/app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized() ; 
  configureDependencies(); 
  runApp(const App());
}
 