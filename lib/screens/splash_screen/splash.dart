import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
static String route = "Splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    Future.delayed(Duration(seconds: 2)
      ,() {
        Navigator.pushReplacementNamed(context, HomeScreen.route);
      },);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/pattern.png"),fit:BoxFit.cover)
      ),
      child: Center(child: Image.asset("assets/Splashlogo.png"))
      );
  }
}
