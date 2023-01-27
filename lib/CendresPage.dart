import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class CendresPage extends StatefulWidget {
  @override
  State<CendresPage> createState() => _CendresPageState();
}

class _CendresPageState extends State<CendresPage> {
  final controller = TextEditingController();
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 9,
      withBottomBar: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('IX - LES CENDRES'),
            AudioButton('Chap9.m4a'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Rendez-vous au Moulin rouge. Un des emblèmes de Paris.\n'
                    'En 1915 un gigantesque incendie s’est déclaré en pleine nuit dans le célèbre cabaret parisien. Aucune victime à déplorer, '
                    'mais la salle est ravagée, malgré l’intervention très rapide des pompiers. Mais tout n’est pas détruit. '
                    'La scène a été sauvée. Un réflexe incroyable : le rideau de fer a été tiré au début de l’incendie et il l’a protégée. '
                    'Les costumes de la loge des femmes ont aussi survécu, ainsi que les décors. Au-dessus de tout ça, '
                    'on peut voir le célèbre moulin lui-même, presque intact et qui restera sans doute comme un message d’espoir.'),
            const SizedBox(height: 20),
            const ImageEnigme("images/cendres1.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme('Ce site de « dépravation et péché » comme certains aiment le souligner, aurait été le berceau du Sacré ?! Quel meilleur endroit pour cacher une relique que tout son opposé.'),
            const SizedBox(height: 20),
            const ImageEnigme("images/cendres2.jpg"),
            const SizedBox(height: 20),
            const ParagrapheEnigme('La scène et les loges des femmes situées au sous sol n’ont pas brûlé, les armatures en métal sont encore debout.'
                'Je découvre les ravages de l’incendies et descend voir les loges.\n\n'
                'Dans la loge, un des boulons des piliers en métal en hauteur semblent mal visé.'
                ' Il donne sur une porte dissimulée dans l’armature.\n\n'
                'Dans ce petit renfoncement gardé est disposé une feuille et une bougie.'
                'Comme si l’on nous narguait pour l’incendie.'
                '\nToujours le même logo sur la feuille. Après des recherche, '
                'je me rends compte que c’est bien depuis le début l’ordre de Malte.'
                'Sur la feuille est écrit \‘ce qui est précieux peut être relevé par bien des manières\’'),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Comment trouver le prochaine indice ?',
              indice1: "Le citron permet de cacher bien des choses",
              indice2: 'La lettre contient des écritures invisibles comment les révéler ',
              infos: '',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'IDEE',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 10,
            ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const NextButton('/derniere'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('feu') || reponse.toLowerCase().contains('bougie') || reponse.toLowerCase().contains('allumer');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
