import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class RestoPage extends StatefulWidget {
  @override
  State<RestoPage> createState() => _RestoPageState();
}

class _RestoPageState extends State<RestoPage> {
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
            const EnigmeTitle('E-MAYBE LE RESTO'),
            const SizedBox(height: 20),
            const Paragraphe(
                '\nDans l’esprit du quartier, populaire, une adresse pas chère\n'
                    'à ne pas louper.\n'
                    'La queue tu es obligée,\n'
                    'si tu veux y manger.'),
            const QuestionEnigme(
              question: '\nQuel resto ?',
              indice1: 'Dans l\'esprit du Chartier',
              indice2: 'pigalle',
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
            if (_isDone) const NextButton('/bar'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('bouillon');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
