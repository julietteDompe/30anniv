import 'package:flutter/material.dart';
import 'package:juju30ans/colors.dart';

class JujuPage extends StatelessWidget {
  final Widget child;

  JujuPage({
    required this.child,
  });

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
      if (height < 600) return _MoveToPortrait();
      return Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        width: width,
        height: height,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
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

  Container _body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        JujuColors.gradientTop,
        JujuColors.gradientBottom,
      ])),
      child: SizedBox(height: MediaQuery.of(context).size.height, child: child),
    );
  }

}

class _MoveToPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Désolé, ça ne fonctionne qu'en mode portrait",
      style: TextStyle(
        fontSize: 20,
        fontFamily: "Century Gothic",
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),
    ));
  }
}
