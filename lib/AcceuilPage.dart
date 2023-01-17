import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';

class AcceuilPage extends StatelessWidget {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 10),
                      child: Text(
                        'Voilà comment ça va se passer …',
                        style: TextStyle(
                          fontFamily: 'Bodoni',
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        await player.setSource(AssetSource('test_audio.mp4'));
                        await player.resume();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Image.asset("/images/audio.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: Text(
                      'là! la lecture',
                      style: TextStyle(
                        fontFamily: 'Qwitcher',
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20, right: 50),
                      child: Text(
                        'la flemme le vocal',
                        style: TextStyle(
                          fontFamily: 'Qwitcher',
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: Image.asset("images/fleche_bas.png"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 80),
                      child: Image.asset("images/fleche_haut.png"),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                """
Comme vous le savez (presque) tous, j’ai choppé un super appart qui appartient à mon oncle. 
Après l’avoir aménagé, inauguré, l’hiver glacé est arrivé. Petit soucis de radiateur, m’a fait découvrir un ancien carnet coincé entre le radiation et le mur. Il avait l’air plutôt … vieux (on n’a pas 95 ans ! Mais lui … peut être).
Ni une ni deux, je l’ouvre et découvre que c’est le journal du grand-père de 1916 ! 😳 ouch ! Intéressant. Je le ramène à Nancy pour le rendre à mon oncle. 
À Noël, j’apprends l’origine de cet appartement qui était en fait le bureau d’un ancien relais de poste. Son grand-père avait un poste clé dans une «association» qui œuvre pour la restauration et la protection d’œuvres d’art. Il avait accès à ce bureau pendant la guerre, pour assurer la préservation des œuvres et communiquer facilement avec les différents quartiers de Paris et l’ensemble de la France voir même l’étranger ! Hum hum 🤔 je choisis finalement de conserver le carnet pour le lire avant de le restituer.
""",
                style: TextStyle(
                  fontFamily: 'Savoye',
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 40),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 160,
                  child: JujuBouton('LA SUITE', () {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
