import 'package:flutter/material.dart';
import 'package:juju30ans/colors.dart';

void showIndicePopUp({
  required String indice1,
  required String indice2,
  required String infos,
  required BuildContext context,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: _Indices(indice1, indice2, infos),
        );
      });
}

class _Indices extends StatefulWidget {
  final String indice1;
  final String indice2;
  final String infos;

  _Indices(this.indice1, this.indice2, this.infos);

  @override
  State<_Indices> createState() => _IndicesState();
}

class _IndicesState extends State<_Indices> {
  bool indice1Open = false;
  bool indice2Open = false;
  bool infosOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        JujuColors.gradientTop,
        JujuColors.gradientBottom,
      ])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  indice1Open = !indice1Open;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('INDICE   1', style: TextStyle(fontFamily: 'Bodoni', fontSize: 30)),
                    Expanded(child: Container()),
                    Text('>', style: TextStyle(fontFamily: 'Bodoni', fontSize: 30)),
                  ],
                ),
              ),
            ),
          ),
          if (indice1Open) Text(widget.indice1, style: TextStyle(fontFamily: 'Savoye', fontSize: 24)),
          Center(child: Container(width: 140, height: 1, color: Colors.black12)),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  indice2Open = !indice2Open;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('INDICE   2', style: TextStyle(fontFamily: 'Bodoni', fontSize: 30)),
                    Expanded(child: Container()),
                    Text('>', style: TextStyle(fontFamily: 'Bodoni', fontSize: 30)),
                  ],
                ),
              ),
            ),
          ),
          if (indice2Open) Text(widget.indice2, style: TextStyle(fontFamily: 'Savoye', fontSize: 24)),
          Center(child: Container(width: 140, height: 1, color: Colors.black12)),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  infosOpen = !infosOpen;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('INFOS', style: TextStyle(fontFamily: 'Bodoni', fontSize: 30)),
                    Expanded(child: Container()),
                    Text('>', style: TextStyle(fontFamily: 'Bodoni', fontSize: 30)),
                  ],
                ),
              ),
            ),
          ),
          if (infosOpen) Text(widget.infos, style: TextStyle(fontFamily: 'Savoye', fontSize: 24)),
        ],
      ),
    );
  }
}
