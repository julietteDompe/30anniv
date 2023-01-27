import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class SoireePage extends StatefulWidget {
  @override
  State<SoireePage> createState() => _SoireePageState();
}

class _SoireePageState extends State<SoireePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return JujuPage(
      withBottomBar: true,
      level: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('LA SOIREE'),
            const SizedBox(height: 20),
            const Paragraphe(
                '\nVous avez été très bon cette semaine et c\'est pas encore  fini. Mais cette partie sera de la gnognote... \n'),
            const SizedBox(height: 20),
            const Paragraphe(
                'Il vous reste qq efforts pour compléter le planning potentiel '
                    'des lieux pour la soirée. Ces lieux sont en rapport avec l’histoire précédente (plus ou moins).'
                    ' Ce sont des propositions, la plus importante étant la dernière : le bar où on commencera la soirée.\n'),


            const SizedBox(height: 20),
            const ImageEnigme("images/programme.png"),

            const SizedBox(height: 20),
            const NextButton('/quartier'),
            const SizedBox(height: 60)

          ],
        ),
      ),
    );
  }
}
