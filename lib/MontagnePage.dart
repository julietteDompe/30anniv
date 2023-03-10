import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/CodeRepository.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/juju_edit_text.dart';
import 'package:juju30ans/pop.dart';

class MontagnePage extends StatefulWidget {
  @override
  State<MontagnePage> createState() => _MontagnePageState();
}

class _MontagnePageState extends State<MontagnePage> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  bool _isDone = false;
  bool _isDone2 = false;

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      withBottomBar: true,
      level: 3,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('III - LA MONTAGNE'),
            AudioButton('Chap3.m4a'),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Effectivement, Legentil est un des deux initiateurs du projet de la basilique du Sacré-Cœur et est à la naissance du Voeu national.'),
            const SizedBox(height: 20),
            ImageEnigme("images/montagne1.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                "Le « Vœu national »\nDurant l'occupation de Paris par les Prussiens en 1870, Alexandre Legentil rédige un Vœu personnel qui s'achève par la promesse «de contribuer à l'érection à Paris d'un sanctuaire dédié au Cœur Sacré de Jésus», puis lance le projet de construction de l'église du Sacré-Cœur (basilique mineure depuis 1919), qui prend tout son sens après la défaite franco-prussienne, le traumatisme patriotique de la perte de l’Alsace-Lorraine et les ravages de la Commune de Paris. "),
            const SizedBox(height: 20),
            ImageEnigme("images/montagne2.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                "Les promoteurs de la construction font ensuite appel à l'Assemblée Nationale afin que l'église soit reconnue comme étant d'utilité publique. Après des débats houleux, la loi d’utilité publique est votée en 1873, elle est financée par les francais.\nLe cœur d'Alexandre Legentil est déposé dans la crypte de la basilique du Sacré-Cœur de Montmartre, où il est encore présent aujourd'hui."),
            const SizedBox(height: 20),
            ImageEnigme("images/montagne3.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                "Dans la crypte, je trouve l’urne du cœur d’Alexandre Legentil. Elle est disposée face à la statut de Jésus bras ouvert repoussant les murs « en son cœur … le chemin s’éclairera ».\nSur l’urne est gravée une inscription « infinitos dilectionis thesauros, je veillerai à jamais sur lui » accompagnée de ce symbole"),
            const SizedBox(height: 20),
            ImageEnigme("images/montagne4.png"),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                "Dans une croix gravée dans le mur de marbre positionné derrière l’urne, un morceau de papier dépasse. J’y découvre un rouleau. Il s’agit d’une peinture"),
            const SizedBox(height: 20),
            ImageEnigme("images/montagne5.jpg"),
            const SizedBox(height: 20),
            const QuestionEnigme(
              question: 'Qui a réalisé cette peinture ?',
              indice1: 'Il a vécu à Montmartre pdt 2 ans en 1886',
              indice2: 'Ce tableau séjourne au musée des beaux art d’Argentine',
              infos: 'Il se serait coupé l’oreille et vient des pays bas',
            ),
            if (!_isDone)
              AnswerBlock(
                hint: 'LE NOM DU PEINTRE',
                condition: _checkAnswer,
                controller: controller,
                onSuccess: _onSuccess,
                levelToUnlock: 4,
              ),
            if (_isDone) const SizedBox(height: 20),
            if (_isDone) const QuestionEnigme(
              question: 'Quel est le nom du tableau ?',
              indice1: 'Il y a un moulin sur le tableau',
              indice2: 'En vrai, fais un effort',
              infos: 'Passe chez l\'opticien, là c\'est grave!',
            ),
            if (_isDone && !_isDone2) AnswerBlock(
              hint: 'LE NOM DU TABLEAU',
              condition: _condition2,
              controller: controller2,
              onSuccess: _onSuccess2,
              levelToUnlock: 4,
            ),
            if (_isDone2) const SizedBox(height: 20),
            if (_isDone2)
              const ParagrapheEnigme(
                  "OK, donc rendons-nous dans cette direction : le Moulin de la Galette (ou Moulin du Blute-Fin) .. \nIl semblerait que ce Legentil soit un des protecteurs du coeur de Jésus au sens figuré : il a fait construire le Sacré-Cœur qui est une dévotion au cœur de Jésus-Christ, en tant que symbole de l'amour divin par lequel le fils de Dieu a pris la nature humaine et a donné sa vie pour les hommes. \nMais également au sens propre, une rumeur circule que la relique du coeur de Jésus est protégée par des organisations secrètes. Le coeur du divin ... qui proférerait la vie éternelle. Une des reliques les plus convoitées dans ce monde. Imaginez le entre de mauvaises mains.\nIl semblerait que l’une des raisons de la création du Sacré Coeur fut de mettre en sécurité ce coeur en cette période."),
            if (_isDone2) const SizedBox(height: 20),
            if (_isDone2) const NextButton('/fete'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  bool _checkAnswer(String answer) {
    return answer.toLowerCase().contains('van') && answer.toLowerCase().contains('gogh');
  }

  void _onSuccess() {
    setState(() {
      _isDone = true;
    });
  }

  bool _condition2(String reponse) {
    return reponse.toLowerCase().contains("moulin") &&
        (reponse.toLowerCase().contains('galette') ||
            (reponse.toLowerCase().contains('blute') && reponse.toLowerCase().contains('fin')));
  }

  void _onSuccess2() {
    setState(() {
      _isDone2 = true;
    });
  }
}

class EnigmeTitle extends StatelessWidget {
  final String label;

  const EnigmeTitle(this.label);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: 'Bodoni',
          ),
        ),
      ),
    );
  }
}
class Titlee extends StatelessWidget {
  final String label;

  const Titlee(this.label);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: 'Bodoni',
          ),
        ),
      ),
    );
  }
}

class AudioButton extends StatelessWidget {
  final player = AudioPlayer();
  final String asset;

  AudioButton(this.asset);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              await player.setSource(AssetSource(asset));
              await player.resume();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset("/images/audio.png"),
            ),
          ),
        ),
      ),
    );
  }
}

class ParagrapheEnigme extends StatelessWidget {
  final String label;

  const ParagrapheEnigme(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        label,
        style: const TextStyle(fontFamily: 'Savoye', fontSize: 22, letterSpacing: 5),
      ),
    );
  }
}

class Paragraphe extends StatelessWidget {
  final String label;

  const Paragraphe(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        label,
        style: const TextStyle(fontFamily: 'Savoye', fontSize: 20, letterSpacing: 3),
      ),
    );
  }
}

class ImageEnigme extends StatelessWidget {
  final String asset;
  final double? height;

  const ImageEnigme(this.asset, [this.height]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: InteractiveViewer(
          maxScale: 5,
          child: Image.asset(asset, height: height),
        ),
      ),
    );
  }
}

class QuestionEnigme extends StatelessWidget {
  final String question;
  final String indice1;
  final String indice2;
  final String infos;

  const QuestionEnigme({
    required this.question,
    required this.indice1,
    required this.indice2,
    required this.infos,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(
              question,
              style: const TextStyle(fontFamily: 'Bodoni', fontSize: 24),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showIndicePopUp(
                context: context,
                indice1: indice1,
                indice2: indice2,
                infos: infos,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset("images/info.png"),
            ),
          ),
        ),
      ],
    );
  }
}

class AnswerBlock extends StatefulWidget {
  final String hint;
  final bool Function(String) condition;
  final TextEditingController controller;
  final void Function() onSuccess;
  final int levelToUnlock;

  const AnswerBlock({
    required this.hint,
    required this.condition,
    required this.controller,
    required this.onSuccess,
    required this.levelToUnlock,
  });

  @override
  State<AnswerBlock> createState() => _AnswerBlockState();
}

class _AnswerBlockState extends State<AnswerBlock> {
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: JujuEditText(
              onValidatePressed: () {
                _checkMessage();
              },
              controller: widget.controller,
              hint: widget.hint),
        ),
        if (_isError)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Nope, tu le fais exprès',
              style: TextStyle(fontFamily: 'Bodoni', fontSize: 24),
            ),
          ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 160,
              child: JujuBouton("Check", () {
                _checkMessage();
              }),
            ),
          ),
        ),
      ],
    );
  }

  void _checkMessage() {
    if (widget.condition(widget.controller.text)) {
      widget.onSuccess();
      _bumpCode();
    } else {
      setState(() {
        _isError = true;
      });
    }
  }

  void _bumpCode() {
    final db = FirebaseFirestore.instance;
    db.collection("users").where("code", isEqualTo: CodeRepository.instance.code).get().then((event) {
      for (var doc in event.docs) {
        final userLevel = (doc.data()["levelUnlocked"] as int);
        if (userLevel < widget.levelToUnlock) {
          db.collection("users").doc(doc.id).set({
            "levelUnlocked": widget.levelToUnlock,
            "code": CodeRepository.instance.code,
          });
        }
      }
    });
  }
}

class NextButton extends StatelessWidget {
  final String nextPage;

  const NextButton(this.nextPage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 240,
          child: JujuBouton("ALLER NEXT", () {
            Navigator.of(context).pushNamed(nextPage);
          }),
        ),
      ),
    );
  }
}

class GoButton extends StatelessWidget {
  final String nextPage;

  const GoButton(this.nextPage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 240,
          child: JujuBouton("ALLER GO", () {
            Navigator.of(context).pushNamed(nextPage);
          }),
        ),
      ),
    );
  }
}

