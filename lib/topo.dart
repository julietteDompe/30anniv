import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';

import 'home.dart';

class topoPage extends StatelessWidget {
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 34, top: 42),
              child: Text(
                'LE TOPO',
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
                'Chaque jour à partir de 15h deux énigmes vont se débloquer. Le but est de deviner où nous nous retrouverons vendredi prochain.\nMais avant ça, plongez-vous dans l’expédition d’une vie.\nÀ vous de jouer.',
                style: TextStyle(
                  fontFamily: 'Savoye',
                  fontSize: 24,
                  letterSpacing: 4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                        'Ps : Vous n’avez pas besoin de vous déplacer pour trouver les solutions ',
                        style: TextStyle(
                          fontFamily: 'Qwitcher',
                          fontSize: 20,
                          letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: JujuBouton('LET\'S GO', () {
              Navigator.of(context).pushNamed('/acceuil');
            }),
          ),
          ],
        ),
      ),
    ));
  }
}
