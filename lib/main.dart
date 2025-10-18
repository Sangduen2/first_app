import 'package:first_app/api_example/ApiExampleList.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Assignment/week4.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:first_app/api_example/ApiExample.dart';
import 'package:first_app/api_example/Assigmentweek5.dart';
import 'package:first_app/page/simple_custom_widget.dart';
import 'package:first_app/components/custom_counter_widget.dart';
import 'package:first_app/components/custom_profile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const CustomProfileCard(
            name: 'Sasima Phangyang',
            position: 'Student',
            email: 'phangyang_s@silpakorn.edu',
            phoneNumber: '0931827311',
            imageUrl:
                'https://scontent.fbkk12-3.fna.fbcdn.net/v/t39.30808-6/471374885_2617408588456588_2604379789553647314_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=LLyDR8TUrcwQ7kNvwEO42Ov&_nc_oc=AdnjPaF0XzHFcGbJ7wtmnVuNvom4G9Qk-Fq9OraT22nL4z1k2mfHhPahxcjs8Db6kvM&_nc_zt=23&_nc_ht=scontent.fbkk12-3.fna&_nc_gid=jVdJ6CGcVjicxIxYeT6ZYQ&oh=00_AfdQwawQwGLbpg0-i_e7uGdjvANZgkslBlG4jNhERuP6IA&oe=68F8DE80'));
  }
}
