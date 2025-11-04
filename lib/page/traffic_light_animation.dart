import 'package:flutter/material.dart';

class TrafficLightAnimation extends StatefulWidget {
  const TrafficLightAnimation({super.key});

  @override
  State<TrafficLightAnimation> createState() => _TrafficLightAnimationState();
}

class _TrafficLightAnimationState extends State<TrafficLightAnimation> {
  int _trafficLightState = 0;

  double _redOpacity = 1.0;
  double _yellowOpacity = 0.3;
  double _greenOpacity = 0.3;

  static const Duration _animationDuration = Duration(milliseconds: 500);
  static const double _onOpacity = 1.0;
  static const double _offOpacity = 0.3;

  void _changeLight() {
    setState(() {
      _trafficLightState = (_trafficLightState + 1) % 3;

      switch (_trafficLightState) {
        case 0:
          _redOpacity = _onOpacity;
          _yellowOpacity = _offOpacity;
          _greenOpacity = _offOpacity;
          break;
        case 1:
          _redOpacity = _offOpacity;
          _yellowOpacity = _onOpacity;
          _greenOpacity = _offOpacity;
          break;
        case 2:
          _redOpacity = _offOpacity;
          _yellowOpacity = _offOpacity;
          _greenOpacity = _onOpacity;
          break;
      }
    });
  }

  Widget _buildLight(Color color, double opacity) {
    return AnimatedOpacity(
      duration: _animationDuration,
      curve: Curves.easeInOut,
      opacity: opacity,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            if (opacity == _onOpacity)
              BoxShadow(
                color: color.withOpacity(0.8),
                blurRadius: 20,
                spreadRadius: 5,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Light Animation'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: <Widget>[
                  _buildLight(Colors.red, _redOpacity),
                  const SizedBox(height: 15),
                  _buildLight(Colors.yellow, _yellowOpacity),
                  const SizedBox(height: 15),
                  _buildLight(Colors.green, _greenOpacity),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _changeLight,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.purple,
              ),
              child: const Text(
                'เปลี่ยนไฟ',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
