import 'package:flutter/material.dart';

class AnimatedTest extends StatefulWidget {
  const AnimatedTest({super.key});

  @override
  State<AnimatedTest> createState() => _AnimatedTestState();
}

class _AnimatedTestState extends State<AnimatedTest> {
  double _size = 100;
  Color _color = Colors.red;
  double _opecity = 0;
  bool _isLeft = false;
  double _padding = 10;
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            child: _isFirst
            ?Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              )
            : T
              
            )),
            Positioned(
              right: 10,
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLeft = !_isLeft;
                  });
                }, child: Text('Move Box')),)
        ],
      ),
    )
  }
}
