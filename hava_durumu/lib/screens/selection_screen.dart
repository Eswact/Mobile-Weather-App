import 'package:flutter/material.dart';
import 'package:hava_durumu/screens/loading_screen.dart';

class SelectionScreen extends StatefulWidget{

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {

  late int sayac;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child : Column(
          children: <Widget>[
            const SizedBox(height: 137),
            ElevatedButton(
              onPressed: () {
                sayac = 0;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(sayac);
                }));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 53, vertical: 15),
                  textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('Konum'),
            ),
            const SizedBox(height: 37),
            ElevatedButton(
              onPressed: () {
                sayac = 34;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(sayac);
                }));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('İstanbul'),
            ),
            const SizedBox(height: 37),
            ElevatedButton(
              onPressed: () {
                sayac = 6;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(sayac);
                }));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 15),
                  textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('Ankara'),
            ),
            const SizedBox(height: 37),
            ElevatedButton(
              onPressed: () {
                sayac = 35;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(sayac);
                }));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 15),
                  textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('İzmir'),
            ),
            const SizedBox(height: 37),
            ElevatedButton(
              onPressed: () {
                sayac = 16;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(sayac);
                }));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('Bursa'),
            ),
            const SizedBox(height: 37),
            ElevatedButton(
              onPressed: () {
                sayac = 11;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(sayac);
                }));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 53, vertical: 15),
                  textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('Bilecik'),
            ),
          ],
        ),
      ),
    );
  }

}