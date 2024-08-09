import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_quotes_application/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HomePage());
}