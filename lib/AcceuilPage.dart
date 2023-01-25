import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/CodeRepository.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';

class AcceuilPage extends StatefulWidget {
  @override
  State<AcceuilPage> createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 1,
      child: Stack(
        children: [
          SingleChildScrollView(
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
                SizedBox(
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
                      letterSpacing: 6,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 40),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 160,
                      child: JujuBouton('LA SUITE', () {
                        _launchNextEnigme(context);
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: const Color(0xFFFFF5F7F2),
              height: 54,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/chapitres");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("images/chapitres.png", height: 26, width: 26),
                          const SizedBox(height: 2),
                          const Center(child: Text('CHAPITRES', style: TextStyle(fontFamily: 'Popins', fontSize: 12))),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Container(height: 18, width: 1, color: const Color(0xFF9C825E)),
                      )),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: JujuColors.gradientBottom,
                                offset: const Offset(
                                  3.0,
                                  42.0,
                                ),
                                spreadRadius: 1.0,
                              ),
                            ]),
                            child: Transform.translate(
                              offset: const Offset(5, 0),
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: Text('START',
                                    style: TextStyle(fontFamily: 'Popins', fontSize: 12, fontWeight: FontWeight.w700)),
                              ),
                            )),
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Container(height: 18, width: 1, color: const Color(0xFF9C825E)),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/sac');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("images/sac.png", height: 26, width: 26),
                            const SizedBox(height: 2),
                            const Center(child: Text('SAC', style: TextStyle(fontFamily: 'Popins', fontSize: 12))),
                            const SizedBox(height: 4),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  _launchNextEnigme(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset('images/start.png', height: 56, width: 56),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchNextEnigme(BuildContext context) {
    int userLevel = 0;
    final db = FirebaseFirestore.instance;
    db.collection("users").where("code", isEqualTo: CodeRepository.instance.code).get().then((event) {
      for (var doc in event.docs) {
        userLevel = (doc.data()["levelUnlocked"] as int);
      }
      switch (userLevel) {
        case 1:
          Navigator.of(context).pushNamed('/decouverte_yolo_1');
          break;
        case 2:
          Navigator.of(context).pushNamed("/transports");
          break;
        case 3:
          Navigator.of(context).pushNamed("/montagne");
          break;
        case 4:
          Navigator.of(context).pushNamed("/fete");
          break;
        case 5:
          Navigator.of(context).pushNamed("/sista");
          break;
        case 6:
          Navigator.of(context).pushNamed("/carte_postale");
          break;
        case 7:
          Navigator.of(context).pushNamed("/epee");
          break;
        case 8:
          Navigator.of(context).pushNamed("/roi");
          break;
        default:
          Navigator.of(context).pushNamed("/finito");
          break;
      }
    });
  }
}