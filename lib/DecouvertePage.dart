import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';
import 'package:juju30ans/pop.dart';
import 'package:juju30ans/juju_edit_text.dart';

class DecouvertePage extends StatefulWidget {
  @override
  State<DecouvertePage> createState() => _DecouvertePageState();
}

class _DecouvertePageState extends State<DecouvertePage> {
  final player = AudioPlayer();

  final controller = TextEditingController();

  bool _isDone = false;

  bool _isError = false;

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
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'I - LA DÉCOUVERTE',
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
                          await player.setSource(AssetSource('test_audio.mp4'));
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    'A mon retour, j’ouvre ce livre et je découvre coincé dans la couverture en cuir, un plan, une roue avec une correspondance alphabétique et une feuille noire avec des trous (regarde ton sac!).',
                    style: TextStyle(fontFamily: 'Savoye', fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        Align(alignment: Alignment.bottomLeft, child: Image.asset("images/decouverte_2.png")),
                        Align(
                            alignment: Alignment.topCenter, child: Image.asset("images/decouverte_1.png", height: 220)),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      'Et voilà comment ça commence …',
                      style: TextStyle(fontFamily: 'Savoye', fontSize: 24),
                    ),
                  ),
                ),
                Image.asset("images/separateur.png"),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Center(
                    child: Text(
                      """
Lundi 13 novembre 1916


       Je me trouve à mon bureau quand je trie les lettres avant qu’elles ne soient traitées par les Ptt ! Mon statut me permet d’avoir ce privilège, en temps de guerre pour appréhender aux mieux les informations et faire le nécessaire pour récupérer les œuvres réparties aux 4 coins de Paris et de la France pour les protéger de l’envahisseur.
Cependant en ce 13 novembre 1916, je suis retenu par une lettre adressée à ce bureau

Bureau de « l’ordre »
Ptt
244 rue de Charenton

Ce bureau étant tenu secret, qui pouvait bien adresser cette lettre !? J’ouvre l’enveloppe, j’y trouve un ticket et une lettre.
Évidemment, en temps de guerre nous envoyons nos messages de manière codée. 
                     """,
                      style: TextStyle(fontFamily: 'Savoye', fontSize: 24),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(child: Image.asset("images/decouverte_3.png")),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 30, bottom: 00, right: 10),
                        child: Text(
                          'Quel message contient la lettre !?',
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
                            indice1: 'indice1',
                            indice2: 'yolo 2',
                            infos: 'infos yolo',
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
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'Les indices si besoins',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Qwitcher',
                          ),
                        ),
                      ),
                      Image.asset("images/fleche_bas.png", height: 60),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
                if (!_isDone)
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: JujuEditText(
                        onValidatePressed: () {
                          _checkMessage();
                        },
                        controller: controller,
                        hint: 'LE MESSAGE'),
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
                if (!_isDone)
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
                          Navigator.of(context).pushNamed('/');
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
      if (controller.text == "testtest") {
        _isError = false;
        _isDone = true;
      } else {
        _isError = true;
      }
      controller.text = '';
    });
  }
}
