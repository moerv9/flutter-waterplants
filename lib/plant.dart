import 'package:flutter/material.dart';


class PlantScreen extends StatefulWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  _PlantScreenState createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: entries und myColor noch vor build plazieren,
    // Für Hotreload funktioniert das im build aber besser

    //Elemente die in der Liestview sind
    final List<Widget> entries = [
      const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image(
            image: AssetImage("assets/images/plant.jpeg"),
            height: 400,
            fit: BoxFit.fitWidth,
          )),
      const Text.rich(
        TextSpan(
            text: 'Zierpfeffer\n',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
            children: <TextSpan>[
              TextSpan(
                  text: 'Zimmer',
                  style: TextStyle(fontSize: 20, color: Colors.white70))
            ]),
      ),
      Row(
        children: const <Widget>[
          Expanded(
            child: Text.rich(
              TextSpan(
                  text: 'Gießen\n',
                  style: TextStyle(color: Colors.blue),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'In 5 Tagen',
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                  text: 'Düngen\n',
                  style: TextStyle(color: Colors.deepOrange),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'In 14 Tagen',
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
            ),
          ),
        ],
      ),
      const Text.rich(
        TextSpan(
            text: 'Notizen\n',
            style: TextStyle(color: Colors.indigo),
            children: <TextSpan>[
              TextSpan(
                text:
                    'Muss regelmäßig von Staub befreit werden und alle paar Tage gedreht werden',
                style: TextStyle(color: Colors.white),
              )
            ]),
      ),
    ];
    //Farben der Listview
    final List myColors = <Color>[
      Colors.transparent,
      Colors.grey.shade700,
      Colors.grey.shade700,
      Colors.grey.shade700,
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Zierlicher Peter'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          // ListView.separated muss mit dem itemBuilder gebaut werden
          itemBuilder: (BuildContext context, int index) {
            return Container(
                // height: index == 0 ? 500 : Null,

                child: entries[index],
                // das Bild (Index 0) ist schon in einem abgerundeten Container
                decoration: index == 0
                    ? null
                    : BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: myColors[index],
                        border: Border.all(
                          width: 8,
                          color: Colors.transparent,
                        ),
                      ));
          },
          // Der Abstand zw. den Listenelementen
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.transparent,
            height: 10,
          ),
        ));
  }
}
