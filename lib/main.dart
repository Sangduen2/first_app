import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyWidget()
    );
  }
}

//widget ที่เราสร้างเอง
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              //color: Colors.red,
              height: 300, 
              width: 120,
              decoration: 
                BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20) )
            ),
            Positioned(
              top:20,
              left: 20,
              child: Container(
                height: 80, 
                width: 80,
                decoration: 
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red)),
            ),

            Positioned(
              top:110,
              left: 20,
              child: Container(
                height: 80, 
                width: 80,
                decoration: 
                  BoxDecoration(shape: BoxShape.circle, color: Colors.yellow)),

            ),
             Positioned(
              top:200,
              left: 20,
              child: Container(
                height: 80, 
                width: 80,
                decoration: 
                BoxDecoration(shape: BoxShape.circle, color: Colors.green)),
            )],
          )
        ),
        
      );
        
        
  }
}