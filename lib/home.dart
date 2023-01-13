import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:juju30ans/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                Expanded(flex: 4, child: Image.asset("fireworks.png")),
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
                      Image.asset("ballons.png"),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0, -32),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1E2CE),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Oh ouiiiii pardi',
                                  style: TextStyle(
                                    fontFamily: 'Popins',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Container(height: 1, color: Colors.black)
,                          ],
                        ),
                      ),
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
