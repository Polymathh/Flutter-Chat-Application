import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import 'package:chatify/screens/login.dart';
import 'package:chatify/screens/register.dart';
import 'package:chatify/screens/chat.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received: ${message.notification?.title}');
    });
    runApp(ChatApp());
}

class ChatApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Chatify',
            theme: ThemeData(
                primaryColor: Colors.yellow,
                primarySwatch: Colors.purple,
                textTheme: TextTheme(
                    headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                    bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black)
                ), 
                buttonTheme: ButtonThemeData(
                    buttonColor: Colors.purple,
                    textTheme: ButtonTextTheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                ),
            ),
            themeMode: ThemeMode.system,

            initialRoute: '/',
            routes: {
                '/': (context) => const LoginScreen(),
                '/register': (context) => const RegisterScreen(),
                '/chat': (context) =>  ChatScreen(),
            },
        );
    }
}