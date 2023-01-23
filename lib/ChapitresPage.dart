import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/CodeRepository.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';

class ChapitresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JujuPage(
        level: 1,
        child: _Content(),
    );
  }

}
class _Content extends StatefulWidget {
  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  int userLevel = 0;

  @override
  void initState() {
    super.initState();
    final db = FirebaseFirestore.instance;
    db.collection("users").where("code", isEqualTo: CodeRepository.instance.code).get().then((event) {
      for (var doc in event.docs) {
        userLevel = (doc.data()["levelUnlocked"] as int);
      }
      setState(() {
        userLevel = userLevel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'LES CHAPITRES',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Bodoni',
                    ),
                  ),
                ),
              ),
              const ChapitreItem(label: 'I - LA DECOUVERTE', page: '/decouverte_yolo_1'),
              if (userLevel >= 2)
                const ChapitreItem(label: 'II - LES TRANSPORTS', page: '/transports'),
              if (userLevel >= 3)
                const ChapitreItem(label: 'III - LA MONTAGNE', page: '/montagne'),
              if (userLevel >= 4)
                const ChapitreItem(label: 'IV - LA FÊTE', page: '/fete'),
              const SizedBox(height: 60),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: const Color(0xFFFFF5F7F2),
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: JujuColors.gradientBottom,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("images/chapitres.png"),
                      const SizedBox(height: 4),
                      const Center(child: Text('CHAPITRES', style: TextStyle(fontFamily: 'Popins', fontSize: 12))),
                      const SizedBox(height: 8),
                    ],
                  ),
                )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(height: 22, width: 1, color: const Color(0xFF9C825E)),
                    )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                      height: 50,
                      child: Transform.translate(
                        offset: const Offset(0, 5),
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Text('START',
                              style: TextStyle(fontFamily: 'Popins', fontSize: 12, fontWeight: FontWeight.w700)),
                        ),
                      )),
                )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(height: 22, width: 1, color: const Color(0xFF9C825E)),
                    )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("images/sac.png"),
                    const SizedBox(height: 4),
                    const Center(child: Text('SAC', style: TextStyle(fontFamily: 'Popins', fontSize: 12))),
                    const SizedBox(height: 8),
                  ],
                )),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _launchNextEnigme(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: Image.asset("images/play_button.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _launchNextEnigme(BuildContext context) {
    int userLevel = 0;
    final db = FirebaseFirestore.instance;
    db.collection("users").where("code", isEqualTo: CodeRepository.instance.code).get().then((event) {
      for (var doc in event.docs) {
        userLevel = (doc.data()["levelUnlocked"] as int);
      }
      switch (userLevel) {
        case 1:
          Navigator.of(context).pushNamed('/decouverte_yolo_1');
          break;
        case 2:
          Navigator.of(context).pushNamed("/transports");
          break;
        case 3:
          Navigator.of(context).pushNamed("/montagne");
          break;
        default:
          Navigator.of(context).pushNamed("/finito");
          break;
      }
    });
  }
}

class ChapitreItem extends StatelessWidget {
  final String label;
  final String page;

  const ChapitreItem({
    required this.label,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(1),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(page);
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Bodoni',
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text('>',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Bodoni',
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
