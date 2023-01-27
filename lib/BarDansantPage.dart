import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class BarDansantPage extends StatefulWidget {
  @override
  State<BarDansantPage> createState() => _BarDansantPageState();
}

class _BarDansantPageState extends State<BarDansantPage> {
  final controller = TextEditingController();
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 0,
      withBottomBar: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('C - LE BAR DANSANT'),
            const SizedBox(height: 20),
            const Paragraphe(
                '\nLe Louvre et ces boutiques l\'ont formé,\nLa Tour Eiffel à proximité\nTourner, tourner, '
                    '\nil nous fait passer,\nune bonne soirée\n le bus palladium anciennement tt prche il était'),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Quel bar ?',
              indice1: 'Manège tournoillant',
              indice2: 'Bar à Montmatre',
              infos: '',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'Endroit',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 0,
            ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const NextButton('/petitcreux'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('carrousel');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
