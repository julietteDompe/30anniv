import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class FetePage extends StatefulWidget {
  @override
  State<FetePage> createState() => _FetePageState();
}

class _FetePageState extends State<FetePage> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  bool _isDone = false;
  bool _isDone2 = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('IV - LA FÊTE'),
            AudioButton('Chap4.m4a'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Le Moulin de la Galette ne désigne pas un moulin à proprement parler mais le bal public ouvert par la famille Debray, meuniers historiques de la Butte. Le moulin changera souvent d’emplacement dù à l’urbanisation de Paris (au gré des mesures d’alignement de la rue). '),
            const SizedBox(height: 20),
            const ImageEnigme("images/fete1.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Je me rends en ce dimanche des temps maussades au bal. Je sors mon plus bel accoutrement prêt pour mes plus beaux pas de danses. Comme à son habitude même en temps de guerre et malgré son déménagement l’année passée, la salle de réception est comble.Mais où chercher ? Il y a forcement plus d’indices sur la peinture...'),
            const SizedBox(height: 20),
            const ImageEnigme("images/montagne5.png"),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Dans quelle partie du moulin je dois chercher ?',
              indice1: 'Zoom sur la peinture',
              indice2: 'Re zoom wesh',
              infos: 'Rendez vous Vendredi 27 janvier pour mon birthday les lapinous',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'hint',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 4,
            ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone)
              const ParagrapheEnigme("Exactement sur la terrasse du moulin on retrouve le symbole de la première lettre. \nJe me rends donc sur la terrasse du moulin. Sur la rambarde du balcon, le même symbole est gravé. En touchant le symbole, je me rend compte qu’il y a du jeu entre le barreau et la structure. Le barreau se dévisse, il est creux.\nDedans, je trouve un petit sac en tissus avec des tampons d’imprimerie en bronze pour m’indiquer le lieu suivant"),
            if (_isDone) const SizedBox(height: 40),
            if (_isDone) const ParagrapheEnigme('e a s t é e g r l n i i e i s p r'),
            if (_isDone) const SizedBox(height: 40),
            if (_isDone && !_isDone2) const QuestionEnigme(
              question: 'Sur quel lieu dois-je me rendre ?',
              indice1: 'Composé de 3 mots',
              indice2: 'Les lettres sont dans le désordre',
              infos: 'Lieu religieux',
            ),
            if (_isDone && !_isDone2) AnswerBlock(
              hint: 'LE LIEU',
              condition: _condition2,
              controller: controller2,
              onSuccess: _onSuccess2,
              levelToUnlock: 4,
            ),
            if (_isDone2) const SizedBox(height: 20),
            if (_isDone2) const NextButton('/finito'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse == 'yolo';
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }

  bool _condition2(String reponse) {
    return reponse == 'yolo';
  }

  void _onSuccess2() {
    setState(() {
      _isDone2 = true;
    });
  }
}
