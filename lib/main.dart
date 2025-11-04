import 'package:first_app/api_example/ApiExampleList.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Assignment/week4.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:first_app/api_example/ApiExample.dart';
import 'package:first_app/api_example/Assigmentweek5.dart';
import 'package:first_app/page/simple_custom_widget.dart';
import 'package:first_app/components/custom_counter_widget.dart';
import 'package:first_app/components/custom_profile_card.dart';
import 'package:first_app/page/traffic_light_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TrafficLightAnimation(),
    );
  }
}
