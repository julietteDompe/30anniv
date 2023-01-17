import 'package:flutter/material.dart';

class JujuBouton extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const JujuBouton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF1E2CE),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Popins',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(height: 1, color: Colors.black)
              ,                          ],
          ),
        ),
      ),
    );
  }
}