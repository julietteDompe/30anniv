import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class CartPostalePage extends StatefulWidget {
  @override
  State<CartPostalePage> createState() => _CartPostalePageState();
}

class _CartPostalePageState extends State<CartPostalePage> {
  final controller = TextEditingController();
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('VI - CARTE POSTALE'),
            AudioButton('Chap6.m4a'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Effectivement, je découvre dans le pilier 23.12, sur une des pierres de la colonne le symbole du blason. Elle ne semble pas scellée, je la retire et y trouve une carte postale.'),
            const SizedBox(height: 20),
            const ImageEnigme("images/postale1.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme('Au verso, ceci '),
            const SizedBox(height: 20),
            const ImageEnigme("images/postale2.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme('Ok! un alphabet pour déchiffrer un futur message sur la gauche et un message à décoder à droite. '),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Quel est le message de droite ?',
              indice1: "Il y a surement un objet qui peut m\'aider à déchiffrer. La partie gauche servira plus tard",
              indice2: 'La roue tourne',
              infos: 'Rendez vous Vendredi 27 janvier pour mon birthday les lapinous',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'MSG',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 6,
            ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const NextButton('/finito'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('yolo');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
