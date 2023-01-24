import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';

import 'home.dart';

class SacDetailPage extends StatelessWidget {

  final String asset;

  const SacDetailPage(this.asset);

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: -1,
        child: Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        JujuColors.gradientTop,
        JujuColors.gradientBottom,
      ])),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Icon(Icons.arrow_back, size: 60),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          Expanded(
            child: Center(
              child: InteractiveViewer(
                maxScale: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset(asset),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    ));
  }
}
