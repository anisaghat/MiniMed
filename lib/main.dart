import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimed/firebase_options.dart';
import 'package:minimed/screens/welcome_screen/welcome_screen.dart';
import 'package:minimed/router/router.dart';
import 'package:minimed/services/notifications_service.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options : DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationsService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: router,
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
