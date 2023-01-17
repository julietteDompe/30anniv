import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/colors.dart';

import 'home.dart';

class Before22Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JujuPage(
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
          const Padding(
            padding: EdgeInsets.only(left: 34, top: 42),
            child: Text(
              'VOTRE MISSION',
              style: TextStyle(
                fontFamily: 'Bodoni',
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 34),
              child: Text(
                "si vous l'acceptez",
                style: TextStyle(
                  fontFamily: 'Bodoni',
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          const Padding(
            padding: EdgeInsets.only(left: 34, top: 50, right: 34),
            child: Text(
              'Passer un excellent moment en ma compagnie le Vendredi 27 janvier.\nCependant ça serait trop simple de tout vous dévoiler comme ca alors vous allez un peu travailler !',
              style: TextStyle(
                fontFamily: 'Savoye',
                fontSize: 32,
              ),
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 260,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 20),
                      child: Transform.rotate(
                        angle: -pi / 60,
                        child: const Text(
                          'RDV ici à partir de dimanche 22 janvier pour commencer l’expérience !',
                          style: TextStyle(
                            fontFamily: 'Bodoni',
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    ));
  }
}
