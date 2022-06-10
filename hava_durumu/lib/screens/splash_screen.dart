import 'package:flutter/material.dart';
import 'package:hava_durumu/screens/selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key:key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds :1),(){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SelectionScreen()));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.blue]
            )
        ),
        child: Center(
          child: Image.asset(
            "assets/icon.png",
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}