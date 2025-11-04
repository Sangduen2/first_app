import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String user = "";
  String department = "";
  void setPersonalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", "Dev..");
    prefs.setString(, value)
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(children: [
        SwitchListTile(
          title: Text(''),
          value: value, onChanged: onChanged)
      ],),
    )
  }
}