import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class EpeePage extends StatefulWidget {
  @override
  State<EpeePage> createState() => _EpeePageState();
}

class _EpeePageState extends State<EpeePage> {
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
            const EnigmeTitle('VII - L’ÉPÉE'),
            AudioButton('Chap7.m4a'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'À l\'origine du Louvre existait un château fort, construit par le roi Philippe Auguste en 1190.\nL\'une de ses principales'
                    ' missions était la surveillance de la partie aval de la Seine, l\'une des voies traditionnelles empruntées lors des invasions et razzias depuis l\'époque des Vikings. '
                    'Avec le transfert des biens de l\'ordre du Temple à l\'Ordre de Saint-Jean de Jérusalem(ou Ordre de Malte), le Trésor Royal précédemment conservé à la maison du Temple de '
                    'Paris est transporté en 1317 au Louvre. Charles V fait du château une résidence royale.'
                    'De 1662 à 1793, les rois préfèrent vivre à Versailles, mais les académies s\’installent dans '
                    'le palais du Louvre, malgré les travaux en cours.\nA partir de 1725, les "salons" s\'ouvrent à un plus large public.'
                    ' Les prémices d’un musée naissent. En 1793, la Convention supprime toutes les académies au profit d\'une "Commune générale'
                    ' des Arts" et le musée ouvre au public sous le nom de "Museum central des Arts".\n\n'),
            const SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Louvre salle 527 oa 7848 -\n\nÉpée des Grands Maîtres de l\'Ordre de Malte, '
                  'dite "de la Religion',
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Savoye', fontSize: 18, letterSpacing: 2),
            ),
          ),
            const SizedBox(height: 20),
            const ImageEnigme("images/epee1.png"),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Que m’apporte l’épée comme indice ?',
              indice1: "Gravé sur l\’épée",
              indice2: 'L’alphabet dans ton sac',
              infos: '4 mots',
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
