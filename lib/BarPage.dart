import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/CodeRepository.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/juju_edit_text.dart';
import 'package:juju30ans/MontagnePage.dart';
import 'package:juju30ans/pop.dart';

class BarPage extends StatefulWidget {
  @override
  State<BarPage> createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  final controller = TextEditingController();
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      withBottomBar: true,
      level: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('F - LE DÉBUT'),
            const SizedBox(height: 20),
            const Paragraphe(
                '\nTous on le sait,\n'
                    'entre le programme et la réalité'
                    '\nseul compte le premier,'
                    '\npour permettre de nous retrouver,'
                    '\nCe lieu est un bar convoité,'
                    '\noù nous pourrons picolé,'
                    '\nanciennement les grands magasins il est accolé'
                    '\nEn voyage long courrier'
                    '\nil est souvent préféré,'
                    '\naux prix enflammés,'
                    '\nL’adresse a été restauré,'
                    '\nJ’espère qu’il n’a pas changé, '
                    '\Nen tout cas j’en entend encore parler'),
            const SizedBox(height: 60),
            if (!_isDone) const QuestionEnigme(
              question: 'Quel est-il ?',
              indice1: 'Vol moins cher',
              indice2: 'tu vas voir tu vas t\'envoler',
              infos: 'Aller le dernier',
            ),
            if (!_isDone)
              AnswerBlock(
                hint: '...',
                condition: _checkAnswer,
                controller: controller,
                onSuccess: _onSuccess,
                levelToUnlock: 0,
              ),

            if (_isDone) const SizedBox(height: 20),
            if (_isDone)
            const Titlee(' Et surtout n’oubliez pas de vous éclater.\nKiss kiss Bonne Soirée!'),
              if (_isDone) const SizedBox(height: 20),
            if (_isDone) const NextButton('/chapitres'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _checkAnswer(String answer) {
    return answer.toLowerCase().contains('escale');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
