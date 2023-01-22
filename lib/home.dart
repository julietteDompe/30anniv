import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';

class HomePage extends StatelessWidget {
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
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(flex: 4, child: Image.asset("images/fireworks.png")),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: MediaQuery.of(context).size.height / 5),
                    child: Text(
                      'Juju\n30 ans !',
                      style: TextStyle(
                        fontFamily: 'Didot',
                        color: JujuColors.juju30ansText,
                        fontSize: 88,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                    child: Text(
                      'Vous êtes officiellement invités à mes 30 ans \n(édition n° 364)',
                      style: TextStyle(
                        fontFamily: 'Savoye',
                        color: Colors.black,
                        fontSize: 40,
                        letterSpacing: 6,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Transform.rotate(
                            angle: -pi / 60,
                            child: const Text(
                              'Celui qui prononce 31 aura affaire à moi... ',
                              style: TextStyle(
                                fontFamily: 'Qwitcher',
                                color: Colors.black,
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset("images/ballons.png"),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0, -32),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: JujuBouton('OH OUI PARDI', () {
                        Navigator.of(context).pushNamed('/before22');
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const double pi = 3.1415926535897932;
