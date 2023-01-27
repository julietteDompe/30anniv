import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class DancePage extends StatefulWidget {
  @override
  State<DancePage> createState() => _DancePageState();
}

class _DancePageState extends State<DancePage> {
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
            const EnigmeTitle('B - LE DISCO'),
            const SizedBox(height: 20),
            const Paragraphe(
                '\nNous y sommes passés,\nMythique,'
                    '\nil est fréquenté,'
                    '\nphotographique,'
                    '\nil est éclairé'
                    '\naccueille un renommé cabaret,\n'
                    'son bar nous fait buller,\n'
                    'sa boite nous eclater'),
            const QuestionEnigme(
              question: '\nOù s’agit-il ? ?',
              indice1: 'Rouge',
              indice2: 'il tourne tourne ',
              infos: 'En vrai, ca sera peut être  plus un bon vieux Divan du monde à l’ancienne 😜',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'Endroit',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 0,
            ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const NextButton('/bardansant'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('moulin rouge');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
