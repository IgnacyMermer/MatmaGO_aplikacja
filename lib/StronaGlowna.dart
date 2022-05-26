import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class StronaGlowna extends StatefulWidget {
  @override
  _StronaGlownaState createState() => _StronaGlownaState();
}

class _StronaGlownaState extends State<StronaGlowna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          child:SafeArea(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text('MatmaGO',textAlign: TextAlign.center,style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800)),
                SizedBox(height: 40),
                Text("Praca na konkurs \"Zobaczyć matematykę\"",textAlign: TextAlign.center,style: TextStyle(fontSize: 35)),
                SizedBox(height: 20),
                /*RaisedButton(
                  color: Colors.grey[800],
                  padding: EdgeInsets.all(10),
                  child: Text('Strona int.', style: TextStyle(fontSize: 22)),
                  onPressed: () async {
                    if (await canLaunch('')) {
                      await launch('');
                    }
                  },
                )*/

              ],
            ),
          ),
        )
    );
  }
}
