import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('عبدالله صالح المصعبي'),
        ),
        body: Column(
          children: [
            BaseWidget(
              widgetType: 'Row',
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
              ],
            ),
            SizedBox(height: 40),
            BaseWidget(
              widgetType: 'Stack',
              children: [
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.cyanAccent,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Base Widget for Refactoring
class BaseWidget extends StatelessWidget {
  final String widgetType;
  final List<Widget> children;

  const BaseWidget({super.key, required this.widgetType, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: widgetType == 'Row' ? Colors.blue[100] : Colors.green[100],
      child: widgetType == 'Row'
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      )
          : Stack(
        alignment: Alignment.center,
        children: children,
      ),
    );
  }
}