import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class CreuxPage extends StatefulWidget {
  @override
  State<CreuxPage> createState() => _CreuxPageState();
}

class _CreuxPageState extends State<CreuxPage> {
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
            const EnigmeTitle('D - LE PETIT CREUX'),
            const SizedBox(height: 20),
            const Paragraphe(
                '\nLe 23.12 il est passé à la télé,\nà 23h il est diffusé, \nTim Burton l’a réalisé'
                    '\nWalt Disney l’avait inventé,\nNous sustenter face aux meilleurs des mets,\nil nous permet'),
            const QuestionEnigme(
              question: '\nQuel endroit s’agit-il ?',
              indice1: 'animé, burger à tomber',
              indice2: 'pigalle tout pret',
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
            if (_isDone) const NextButton('/resto'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('dumbo');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
