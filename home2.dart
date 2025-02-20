import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Refactored Row and Stack Widgets'),
        ),
        body: Column(
          children: [
            BaseWidget(
              widgetType: 'RowAndColumn',
              children: [
                Text('Row Item 1'),
                Text('Row Item 2'),
                Text('Row Item 3'),
                Text('Column Item 1'),
                Text('Column Item 2'),
                Text('Column Item 3'),
              ],
            ),
            SizedBox(height: 20),
            BaseWidget(
              widgetType: 'RowAndStack',
              children: [
                Text('Row Item 1'),
                Text('Row Item 2'),
                Text('Row Item 3'),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.yellow,
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
      color: widgetType == 'RowAndColumn' ? Colors.blue[100] : Colors.green[100],
      child: Column(
        children: [
          Text(widgetType == 'RowAndColumn' ? 'Row and Column Widget' : 'Row and Stack Widget'),
          SizedBox(height: 10),
          if (widgetType == 'RowAndColumn') ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children.sublist(0, 3),
            ),
            SizedBox(height: 10),
            Column(
              children: children.sublist(3),
            ),
          ] else if (widgetType == 'RowAndStack') ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children.sublist(0, 3),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: children.sublist(3),
              ),
            ),
          ],
        ],
      ),
    );
  }
}