import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:osio/screens/get_started.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    print('firebase user ${FirebaseAuth.instance.currentUser}');


    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )
      ..forward()
      ..repeat(reverse: true);
    _loadWidget();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
  final splashDelay = 5;


  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }


  void navigationPage() async{
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GetStartedScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child:  Padding(
                  padding: const EdgeInsets.all(20),
                  child: AnimatedBuilder(
                    animation: animationController!,
                    builder: (context, child) {
                      return Container(
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: const CircleBorder(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0 * animationController!.value),
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(50),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: Image.asset("assets/images/logo.png",width: 250,height: 250,),
                    ),
                  ),
                )
            ),
            const Align(
                alignment: Alignment.bottomCenter,
                child:  Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(""),
                )
            )


          ],
        )
    );
  }
}

