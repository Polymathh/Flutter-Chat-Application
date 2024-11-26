import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb

import 'package:chatify/screens/login.dart';
import 'package:chatify/screens/register.dart';
import 'package:chatify/screens/chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCbPSeETlZZmRRaWnbuzq0_4XZ5GGpYC-M",
        authDomain: "chatify-548e5.firebaseapp.com",
        projectId: "chatify-548e5",
        storageBucket: "chatify-548e5.appspot.com", // Corrected storageBucket
        messagingSenderId: "880132375815",
        appId: "1:880132375815:web:743af870d24fd5b11431a2",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Message received: ${message.notification?.title}');
  });

  runApp(Chatify());
}

class Chatify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
