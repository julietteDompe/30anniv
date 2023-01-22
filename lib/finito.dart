import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';

import 'home.dart';

class finitoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 0,
        child: Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        JujuColors.gradientTop,
        JujuColors.gradientBottom,
      ])),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 34, top: 42),
                child: Text(
                  'FINITO',
                  style: TextStyle(
                    fontFamily: 'Bodoni',
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 34, top: 50, right: 34),
                child: Text(
                  'T\'as été bonnn dis donc.\nLa régalade mais c\'est tout pour aujourd\'hui... Et oui.',
                  style: TextStyle(
                    fontFamily: 'Savoye',
                    fontSize: 24,
                    letterSpacing: 4,
                  ),
                  ),
                ),
              const Padding(
                padding: EdgeInsets.only(left: 34, top: 50, right: 34),
                child: Text(
                  'La suite demain. 😜',
                  style: TextStyle(
                    fontFamily: 'Savoye',
                    fontSize: 24,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
