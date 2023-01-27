import 'package:flutter/material.dart';
import 'package:juju30ans/JujuPage.dart';
import 'package:juju30ans/MontagnePage.dart';

class FinPage extends StatefulWidget {
  @override
  State<FinPage> createState() => _FinPageState();
}

class _FinPageState extends State<FinPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return JujuPage(
      level: 11,
      withBottomBar: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EnigmeTitle('LA FIN'),
            AudioButton('Cha11.m4a'),
            const SizedBox(height: 20),
            const ImageEnigme("images/fin1.jpg"),
            const SizedBox(height: 20),
            const ParagrapheEnigme(
                'Evidemment, tout s’éclaire. Legentil était de la famille du grand-magasin '
                    '« Au Petit Saint-Thomas » couru en son temps. '
                    'Les grands de ce monde parisien, se côtoyaient, se réunissaient'
                    ' et faisaient parti des mêmes organisations, les magasins Dufayel'
                    ' se voulant être le lieu phare du Paris populaire, les marchés étaient'
                    ' différents… Mais biensur mon père m’en avait parlé il s’agit de l’ordre '
                    'de Malte, tous devient plus clair, depuis la nuit des temps notamment accentué '
                    'pendant les croisades, des sociétés religieuses protectrices des biens '
                    'les plus précieux que l’histoire ait connue ont été fondé et ce en '
                    'léguant de famille en famille. L’ordre de Malte comme on a pu le voir, '
                    'en faisait parti, ordre de protection religieuse, il est dit que les chevaliers '
                    'de cette confrérie (dont on a retrouvé les armements des grands maitres - Louvre )'
                    ' était une des plus glorieuse. C’est le plus ancien ordre du monde'),
            const SizedBox(height: 20),
            const ParagrapheEnigme('L’ordre de Malte appartient aux ordres hospitaliers,'
                ' ordres religieux spécialisés, qui apparaissent à la fin du XIe siècle et'
                ' qui se consacrent aux soins des malades. Plusieurs ordres hospitaliers sont '
                'nés en Terre sainte pour assurer le service des pèlerins malades. L’ordre de Saint '
                'Jean de Jérusalem (autre nom de l’ordre de Malte) est fondé en 1099 à partir d’un '
                'hôpital pour pèlerins situé dans la ville et reconnu par le pape Pascal II en 1113. '
                'Progressivement, l’activité militaire de ces ordres hospitaliers prend le pas sur'
                ' leur activité hospitalière. En 1120, Raymond de Puy, deuxième maître de l’ordre'
                ' de Saint Jean de Jérusalem, crée une classe de chevaliers destinés à défendre la Terre'
                ' sainte par les armes, transformant les hospitaliers de Saint Jean en ordre militaire.'
                ' L’ordre se développe très rapidement, avec des ramifications dans les différents pays '
                'd’Europe. Il abandonne la Terre sainte en 1291 et s’installe à Chypre. Ils s’emparent '
                'de l’île de Rhodes en 1309 et y demeurent jusqu’en 1523, date à laquelle ils sont chassés'
                ' par les turcs. C’est en 1530 qu’ils prennent possession de l’île de Malte, donnée à '
                'l’ordre par Charles Quint. Ils y resteront jusqu’en 1800 lorsque les Anglais prennent'
                ' l’île, et finiront par transférer leur siège à Rome en 1834. Porche du Vatican!'),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const ImageEnigme("images/fin2.jpg"),
            const ParagrapheEnigme('Je me rend aux grands magasins de nuit. Je me faufile '
                'et me cache histoire de rester et chercher tranquillement sans toute l\'agitation journaliere. '
                'Je me rend au niveau du dome où j\'avais apercu de l\'exterieur'
            'un symbole similaire à celui vu precedemment, celui de l\'ordre. '
                'J’entre dans la salle située sous le dome et là au milieu de la salle se trouve'
                'une cérémonie est organisée dans cette pénombre. Des bougies, une table ronde, des personnes que'
                'je reconnais Legentil, Dufayel, Joseph Oller(fondateur du moulin rouge), '
                'Eugène Pujalet(directeur du musée du Louvre), Francois Mitterrand nouvellement'
                ' président de la République et … mon oncle ! Que fait-il ici ? Il vient vers moi et me'
                ' dit : "mon cher Louis, vient t’assoir, on t’attendait ! Nous sommes comme tu as du le comprendre les « maitres » de '
                'l’ordre de malte, les représentants et protecteurs des biens les plus précieux de l’histoire. '
                'Mon oncle en fait parti, tout comme mon père et ma mère de leur vivant. Leurs morts tragiques seraient liées à la protection'
                ' du biens qu’ils avaient en charge.\n'
                'Effectivement, les lieux que tu as vu pour te rendre ici, sont importants. Le sacre coeur fut l’un des nombreux lieux'
                ' de protection de la relique la plus précieuse du monde catholique, le coeur humain dans lequel Dieu '
                'a concentré sa divinité sur Terre. Le Moulin Rouge également, le Louvre, l’église St Pierre de Montmartre, le moulin de la galette'
                'l\'on tous caché.\n'
                'Nous sommes les maîtres en charge de ce trésor. Il est en lieu sur. '
                'Et maintenant, tu as validé la premiere etape pour veuiller sur lui. C\'est une'
                'tres lourde tache et tu pourrais y laisser la vie…  Ceci n’était que la première étape d’une longue aventure'
                ' à travers le monde, les époques et les oeuvres. Es-tu prêt fiston ?’'),
            const SizedBox(height: 20),
            const EnigmeTitle('FIN \n(DE LA PREMIERE PARTIE)'),
          ],
        ),
      ),
    );
  }
}
