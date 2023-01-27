import 'package:flutter/material.dart';
import 'package:juju30ans/AcceuilPage.dart';
import 'package:juju30ans/BarDansantPage.dart';
import 'package:juju30ans/BarPage.dart';
import 'package:juju30ans/CartePostalePage.dart';
import 'package:juju30ans/CendresPage.dart';
import 'package:juju30ans/ChapitresPage.dart';
import 'package:juju30ans/DancePage.dart';
import 'package:juju30ans/DecouvertePage.dart';
import 'package:juju30ans/DernierePage.dart';
import 'package:juju30ans/EpeePage.dart';
import 'package:juju30ans/FetePage.dart';
import 'package:juju30ans/FinPage.dart';
import 'package:juju30ans/MontagnePage.dart';
import 'package:juju30ans/QuartierPage.dart';
import 'package:juju30ans/RestoPage.dart';
import 'package:juju30ans/RoiPage.dart';
import 'package:juju30ans/SacPage.dart';
import 'package:juju30ans/SistaPage.dart';
import 'package:juju30ans/SoireePage.dart';
import 'package:juju30ans/TransportsPage.dart';
import 'package:juju30ans/before22.dart';
import 'package:juju30ans/colors.dart';
import 'package:juju30ans/finito.dart';
import 'package:juju30ans/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:juju30ans/topo.dart';

import 'CreuxPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFF9F3E7, <int, Color>{
          50: JujuColors.gradientBottom,
          100: JujuColors.gradientBottom,
          200: JujuColors.gradientBottom,
          300: JujuColors.gradientBottom,
          400: JujuColors.gradientBottom,
          500: JujuColors.gradientBottom,
          600: JujuColors.gradientBottom,
          700: JujuColors.gradientBottom,
          800: JujuColors.gradientBottom,
          900: JujuColors.gradientBottom,
        }),
      ),
      home: HomePage(),
      routes: {
        "/before22": (context) => Before22Page(),
        "/acceuil": (context) => AcceuilPage(),
        "/decouverte_yolo_1": (context) => DecouvertePage(),
        "/topo": (context) => topoPage(),
        "/finito": (context) => finitoPage(),
        "/transports": (context) => TransportsPage(),
        "/chapitres": (context) => ChapitresPage(),
        "/montagne": (context) => MontagnePage(),
        "/fete": (context) => FetePage(),
        "/sista": (context) => SistaPage(),
        "/carte_postale": (context) => CartPostalePage(),
        "/epee": (context) => EpeePage(),
        "/roi": (context) => RoiPage(),
        "/sac": (context) => SacPage(),
        "/soiree": (context) => SoireePage(),
        "/quartier": (context) => QuartierPage(),
        "/dance": (context) => DancePage(),
        "/bardansant": (context) => BarDansantPage(),
        "/petitcreux": (context) => CreuxPage(),
        "/resto": (context) => RestoPage(),
        "/bar": (context) => BarPage(),
        "/cendres": (context) => CendresPage(),
        "/derniere": (context) => DernierePage(),
        "/fin": (context) => FinPage(),
      },
    );
  }
}
