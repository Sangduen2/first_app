import 'package:first_app/model/air.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Week4 extends StatefulWidget {
  const Week4({super.key});

  @override
  State<Week4> createState() => _Week4State();
}

class _Week4State extends State<Week4> {
  Air? airData;

  @override
  void initState() {
    super.initState();
    fetchAir();
  }

  void fetchAir() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.waqi.info/feed/here/?token=c0cf6205d4f7ab9d1219c5b382ea0db66c0de52c'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Air air = Air.fromJson(data);
        setState(() {
          airData = air;
        });
        print('AQI: ${air.aqi}, City: ${air.city}, IAQI: ${air.iaqi}');
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Map<String, dynamic> getAqiStatus(int aqi) {
    String status;
    Color color;

    if (aqi <= 50) {
      status = 'Good';
      color = Colors.green;
    } else if (aqi <= 100) {
      status = 'Moderate';
      color = Colors.yellow.shade700;
    } else if (aqi <= 150) {
      status = 'Unhealthy for Sensitive Groups';
      color = Colors.orange;
    } else if (aqi <= 200) {
      status = 'Unhealthy';
      color = Colors.red;
    } else if (aqi <= 300) {
      status = 'Very Unhealthy';
      color = Colors.purple;
    } else {
      status = 'Hazardous';
      color = Colors.brown;
    }

    return {'status': status, 'color': color};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Air Quality Index (AQI)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: airData == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    airData!.city,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // กล่องแสดงค่า AQI พร้อมสีพื้นหลัง
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: getAqiStatus(airData!.aqi)['color'],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${airData!.aqi}',
                      style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    getAqiStatus(airData!.aqi)['status'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: getAqiStatus(airData!.aqi)['color'],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Temperature: ${airData!.iaqi} °C',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: fetchAir,
                    child: const Text('Refresh'),
                  ),
                ],
              ),
      ),
    );
  }
}
