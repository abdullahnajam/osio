import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:osio/navigator/bottom_nav.dart';
import 'package:osio/provider/filter_provider.dart';
import 'package:osio/screens/home_page.dart';
import 'package:osio/screens/get_started.dart';
import 'package:osio/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    /*options: const FirebaseOptions(
        apiKey: "AIzaSyDYBppmJeQuHYQ1HQvz7qvKnhk3wMgJJCY",
        authDomain: "osio-c091e.firebaseapp.com",
        projectId: "osio-c091e",
        storageBucket: "osio-c091e.appspot.com",
        messagingSenderId: "285830947753",
        appId: "1:285830947753:web:402c7dafc0144a43245ab8"
    ),*/
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [


          ChangeNotifierProvider<FilterProvider>(
            create: (_) => FilterProvider(),
          ),


        ],
        child:  MaterialApp(

          title: 'OSIO',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          home: SplashScreen(),
        )

    );
  }
}

