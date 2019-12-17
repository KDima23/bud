import 'package:flutter/material.dart';

class AppBarH extends StatelessWidget {
  final double barHeight = 60.0;

  const AppBarH();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
