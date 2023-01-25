import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class RoiPage extends StatefulWidget {
  @override
  State<RoiPage> createState() => _RoiPageState();
}

class _RoiPageState extends State<RoiPage> {
  final controller = TextEditingController();
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 8,
      withBottomBar: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('VIII - LE ROI'),
            AudioButton('Chap8.m4a'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Toute cette histoire fait penser que l’ordre de Malte a un rôle à jouer dans la préservation des biens religieux.'
                    ' Au cours de mon travail, il m’est souvent arrivé de croiser cet ordre. Chaque relique est gardée par'
                    ' une personne de confiance ayant un poste important dans la société, beaucoup font parti d’un ordre.'
                    ' Notamment pour avoir accès à des lieux sécurisés pour pouvoir trouver un endroit loin des '
                    'regards pour disposer ce patrimoine.\nHenri 2 serait le dernier roi chevalier. Or l’ordre de Malte, '
                    'était également un ordre de chevalerie...\n\nCes découvertes semblent nous suggérer qu’Henri 2 aurait été un des protecteurs du ‘Sacré’ (la fameuse relique du coeur de Jésus).'),
            const SizedBox(height: 20),
            const ImageEnigme("images/roi1.png"),
            const SizedBox(height: 20),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Les Trois Grâces. Element du monument funéraire du coeur du roi Henri 2.\n\n',
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Savoye', fontSize: 18, letterSpacing: 2),
              ),
            ),
            const ParagrapheEnigme('On peut voir au pied de la sculpture une gravure indiquant : \"Le cœur du Sacré est rouge comme le sang. Chevaliers de l\’ordre veuillent sur lui. Le secret perdurera tant que le vent activera les moulins.\"'),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Où Henri 2 nous mène-t-il ?',
              indice1: 'Cette gravure cache un message',
              indice2: 'J\’ai probablement qqch pour lire dans mon sac',
              infos: 'Superposer le Cache ',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'MSG',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 9,
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
