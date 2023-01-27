import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class QuartierPage extends StatefulWidget {
  @override
  State<QuartierPage> createState() => _QuartierPageState();
}

class _QuartierPageState extends State<QuartierPage> {
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
            const EnigmeTitle('A - LE QUARTIER'),
            const SizedBox(height: 20),
            const Paragraphe(
                '\nJ’imagine que vous avez une petite idée. \nEn rapport avec l’histoire, vous ne pouvez que trouvez. \nSa beauté en fait sa renommée,'
                    '\nSon agitation nous fait nous y retrouver\n C\'est le plus haut perché !'),
            const QuestionEnigme(
              question: '\nDans quel quartier allons nous gambader ce vendredi ?',
              indice1: 'sacre coeur de ....',
              indice2: 'Aller nun effort',
              infos: 'TOPPPP',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'Endroit',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 0,
            ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const NextButton('/dance'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('montmartre');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
