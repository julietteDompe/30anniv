import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juju30ans/button.dart';
import 'package:juju30ans/colors.dart';
import 'package:juju30ans/juju_edit_text.dart';

import 'CodeRepository.dart';

class JujuPage extends StatefulWidget {
  final Widget child;
  final int level;
  final bool withBottomBar;

  JujuPage({
    required this.child,
    required this.level,
    this.withBottomBar = false,
  });

  @override
  State<JujuPage> createState() => _JujuPageState();
}

class _JujuPageState extends State<JujuPage> {
  int userLevel = -1;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkCode();
  }

  void _checkCode() {
    final db = FirebaseFirestore.instance;
    db.collection("users").where("code", isEqualTo: CodeRepository.instance.code).get().then((event) {
      for (var doc in event.docs) {
        setState(() {
          userLevel = (doc.data()["levelUnlocked"] as int);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (height / width < 1.3) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
        ),
        width: width,
        height: height,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: height - 40,
              width: (height - 40) / 2,
              child: _body(context),
            ),
          ),
        ),
      );
    } else {
      return _body(context);
    }
  }

  Widget _body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        JujuColors.gradientTop,
        JujuColors.gradientBottom,
      ])),
      child: SizedBox(height: MediaQuery.of(context).size.height, child: _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    if (userLevel >= widget.level) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: widget.child),
          if (widget.withBottomBar) NavBarEnigme(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container()),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Text(
                'ENTRE TON CODE :',
                style: TextStyle(
                  fontFamily: 'Bodoni',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Text(
                'Tu as reçu un code par WhatsApp.\nSi tu as un pb pendant la session, reste pas bloqué par bleu, écris moi un petit msg d’amour.',
                style: TextStyle(
                  fontFamily: 'Savoye',
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          JujuEditText(
            controller: controller,
            hint: 'TON CODE',
            onValidatePressed: () {
              CodeRepository.instance.code = controller.text;
              _checkCode();
            },
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 160,
                child: JujuBouton("C'EST PARTI", () {
                  CodeRepository.instance.code = controller.text;
                  _checkCode();
                }),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      );
    }
  }
}

class NavBarEnigme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: const [
          NavItem(label: 'CHAPITRES', asset: 'images/chapitres.png', page: '/chapitres'),
          _Separator(),
          NavItem(label: 'ACCEUIL', asset: 'images/play_button.png', page: '/acceuil'),
          _Separator(),
          NavItem(label: 'SAC', asset: 'images/sac.png', page: '/sac'),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String label;
  final String asset;
  final String page;

  const NavItem({
    required this.label,
    required this.asset,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, page);
          },
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.asset(asset, height: 26, width: 26),
                const SizedBox(height: 2),
                Center(child: Text(label, style: const TextStyle(fontFamily: 'Popins', fontSize: 12))),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3.0),
        child: Container(height: 18, width: 1, color: const Color(0xFF9C825E)),
      ),
    );
  }

  const _Separator();
}
