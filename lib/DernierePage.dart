import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class DernierePage extends StatefulWidget {
  @override
  State<DernierePage> createState() => _DernierePageState();
}

class _DernierePageState extends State<DernierePage> {
  final controller = TextEditingController();
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 10,
      withBottomBar: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('X - LA DERNIERE'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Evidemment, ni une ni deux, je sors mes allumettes et allume la bougie. '
                    'En la déparant sous la feuille, elle me dévoile les infos suivantes'),
            const SizedBox(height: 20),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '48.8856911, 2.3475031',
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Savoye', fontSize: 18, letterSpacing: 2),
              ),
            ),
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
              question: 'Où dois-je me rendre (Nous sommes en 1916) ?',
              indice1: "Ca ressemble á deux chiffres",
              indice2: 'pt une long et lat',
              infos: 'merci maps',
            ),
            if (!_isDone) AnswerBlock(
              hint: 'LIEU',
              condition: _condition,
              controller: controller,
              onSuccess: _onSuccess,
              levelToUnlock: 11,
            ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone)
              const ParagrapheEnigme(
                  "Les grands magasins Dufayel.\nEn 1888, l’établissement "
                      "est repris par Georges Dufayel, un employé du magasin. L’entrepreneur décide "
                      "de s’adresser directement à la clientèle populaire qui habite le quartier. Mais pour y parvenir "
                      "il doit composer avec les bâtiments gigantesques qui s’étendent sur plus d’un hectare."
                      "En plus de ses galeries commerciales, les grands magasins Dufayel abritent bientôt "
                      "un théâtre, une salle de spectacle, un jardin d’hiver et une piste cyclable. "
                      "Désormais le phare illumine le ciel de Paris les soirs de spectacle."),
             if (_isDone) const SizedBox(height: 20),
            if (_isDone) const ImageEnigme("der1.jpg"), const SizedBox(height: 20),
            if (_isDone) AudioButton('Chap10.m4a'),
            if (_isDone)
              const ParagrapheEnigme(
                  "En 1912, les Grands Magasins Dufayel emploient 15 000 personnes et revendique le "
                      "fait d’être devenu le plus grand magasin au monde.Chez Dufayel tout n’est"
                      " que démesure. Pour exemple le magasin renferme une gare et des écuries pour"
                      " les livraisons. De plus un réseau de tunnels et de voies ferrées relient"
                      " les différents espaces entre eux."),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const ImageEnigme("der1.jpg"),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const NextButton('/fin'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _condition(String reponse) {
    return reponse.toLowerCase().contains('Dufayel') || reponse.toLowerCase().contains('magasin');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }
}
