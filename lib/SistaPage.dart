import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class SistaPage extends StatefulWidget {
  @override
  State<SistaPage> createState() => _SistaPageState();
}

class _SistaPageState extends State<SistaPage> {
  final controller = TextEditingController();
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 5,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('V - SISTA'),
            AudioButton('Chap5.m4a'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'L’église Saint-Pierre de Montmartre serait la plus ancienne église de Paris encore debout après celle de Saint-Germain-des-Prés,+ de 800 ans. C’est aussi le plus ancien cimetière de Paris, il abrite près de 80 sépultures visibles depuis l’extérieur de l’église malgré sa fermeture en 1885 à cause de sa saturation. Il y repose encore les anciens habitants de Montmartre (les meuniers, vignerons, paysans…) mais aussi les anciennes sœurs bénédictines.\nAuparavant, Abbaye de Notre-Dame de Montmartre, elle s’interrompt brutalement en 1794. L’ abbesse est guillotinée, les religieuses renvoyées du domaine et l’abbaye quasi intégralement rasée. Seule l’église abbatiale est conservée.'),
            const SizedBox(height: 20),
            const ImageEnigme("images/sista1.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme('L’intérieur ne semble pas être occupé.'),
            const SizedBox(height: 20),
            const ImageEnigme("images/sista2.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme('L’agencement me fait penser à qqch. Mais oui! le plan qui était conservé dans le journal !'),
            const SizedBox(height: 20),
            const ImageEnigme("images/sista3.jpg"),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Ou dois-je regarder ?',
              indice1: 'Sur le plan, il semble y avoir des numéros',
              indice2: 'N\'as t\'on pas déjà un code de ce type ?',
              infos: 'Aller vas-voir dans ton sac',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'LE LIEU',
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
    return reponse.toLowerCase().contains('sacristie');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
