import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/CodeRepository.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/juju_edit_text.dart';
import 'package:juju30ans/pop.dart';

class TransportsPage extends StatefulWidget {
  @override
  State<TransportsPage> createState() => _TransportsPageState();
}

class _TransportsPageState extends State<TransportsPage> {
  final player = AudioPlayer();

  final controller = TextEditingController();
  final controller2 = TextEditingController();

  bool _isDone = false;
  bool _isDone1 = false;

  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 2,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'II - LES TRANSPORTS',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Bodoni',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          await player.setSource(AssetSource('Chap2.m4a'));
                          await player.resume();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Image.asset("/images/audio.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Text(
                    'Je me rends à la gare avec le ticket pour récupérer le contenu de la consigne 45 !\nJ’y trouve une petite boîte en bois. Dedans se trouvent un collier et un bout de papier chiffonné.',
                    style: TextStyle(fontFamily: 'Savoye', fontSize: 24, letterSpacing: 6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(child: Image.asset("images/transports1.png", height: 100)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Sur le collier encore le même symbole que dans la lettre : c’est un médaillon familial qui s’ouvre. D’un côté une inscription 23.12 et de l’autre une photo.',
                    style: TextStyle(
                      fontFamily: 'Savoye',
                      fontSize: 24,
                      letterSpacing: 6,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(child: Image.asset("images/transports2.png", height: 100)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Sur le papier chiffonné est écrit : « le sacré doit être protégé, rapprochez-vous de Legentil, en son cœur le chemin s’éclairera »',
                    style: TextStyle(
                      fontFamily: 'Savoye',
                      fontSize: 24,
                      letterSpacing: 6,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(child: Image.asset("images/transports3.png", height: 240)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Il faut que je trouve qui est ce Legentil et où le trouver ?',
                    style: TextStyle(
                      fontFamily: 'Savoye',
                      fontSize: 24,
                      letterSpacing: 6,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 30, bottom: 00, right: 10),
                        child: Text(
                          'Où faut-il que j’aille chercher ?',
                          style: TextStyle(fontFamily: 'Bodoni', fontSize: 24),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          showIndicePopUp(
                            context: context,
                            indice1: 'Qui est legentil on est en 1916?',
                            indice2: 'À quoi a t\'il participé ?',
                            infos: 'Rendez vous Vendredi 27 janvier pour mon birthday les lapinous',
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Image.asset("images/info.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                if (!_isDone1)
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: JujuEditText(
                        onValidatePressed: () {
                          _checkMessage1();
                        },
                        controller: controller,
                        hint: 'LE MESSAGE'),
                  ),
                if (_isDone1)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 30, bottom: 00, right: 10),
                          child: Text(
                            'Que dois-je trouver dans la basilique ?',
                            style: TextStyle(fontFamily: 'Bodoni', fontSize: 24),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            showIndicePopUp(
                              context: context,
                              indice1: 'Relisez attentivement le message',
                              indice2: 'Quelle partie de Legentil repose ici ?',
                              infos: 'Rendez vous Vendredi 27 janvier pour mon birthday les lapinous',
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Image.asset("images/info.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!_isDone && _isDone1)
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: JujuEditText(
                        onValidatePressed: () {
                          _checkMessage();
                        },
                        controller: controller2,
                        hint: 'RÉPONSE'),
                  ),
                if (_isError)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Ah non ! retente ta chance',
                      style: TextStyle(fontFamily: 'Bodoni', fontSize: 24),
                    ),
                  ),
                if (_isError) const SizedBox(height: 20),
                if (!_isDone1)
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 160,
                        child: JujuBouton("Check", () {
                          _checkMessage1();
                        }),
                      ),
                    ),
                  ),
                if (_isDone1 && !_isDone)
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 160,
                        child: JujuBouton("Check", () {
                          _checkMessage();
                        }),
                      ),
                    ),
                  ),
                if (_isDone)
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 240,
                        child: JujuBouton("ON PASSE À LA SUITE", () {
                          Navigator.of(context).pushNamed('/finito');
                        }),
                      ),
                    ),
                  ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _checkMessage() {
    setState(() {
      if (controller2.text.toLowerCase().contains("basilique du sacré coeur") || controller2.text.toLowerCase().contains("sacré coeur") || controller2.text.toLowerCase().contains("sacre coeur")) {
        _bumpCode();
        _isError = false;
        _isDone = true;
      } else {
        _isError = true;
      }
      controller2.text = '';
    });
  }

  void _checkMessage1() {
    setState(() {
      if (controller.text.toLowerCase().contains("coeur")|| controller.text.toLowerCase().contains("coeur de Legentil")) {
        _isError = false;
        _isDone1 = true;
      } else {
        _isError = true;
      }
      controller.text = '';
    });
  }

  void _bumpCode() {
    final db = FirebaseFirestore.instance;
    db.collection("users").where("code", isEqualTo: CodeRepository.instance.code).get().then((event) {
      for (var doc in event.docs) {
        final userLevel = (doc.data()["levelUnlocked"] as int);
        if (userLevel < 3) {
          db.collection("users").doc(doc.id).set({
            "levelUnlocked": 2,
            "code": CodeRepository.instance.code,
          });
        }
      }
    });
  }
}
