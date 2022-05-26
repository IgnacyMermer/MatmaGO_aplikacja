import 'package:flutter/material.dart';
import 'package:matma_go/Matematyka.dart';
import 'package:matma_go/teoria/Calki.dart';
import 'package:matma_go/teoria/CiagiNiesk.dart';
import 'package:matma_go/teoria/FunkcjaJednejZmiennej.dart';
import 'package:matma_go/teoria/GraniceFunkcji.dart';
import 'package:matma_go/teoria/KryteriumZbieznosci.dart';
import 'package:matma_go/teoria/LiczbyZespolone.dart';
import 'package:matma_go/teoria/LiczbyZespolone2.dart';
import 'package:matma_go/teoria/Logika.dart';
import 'package:matma_go/teoria/Nierownosci.dart';
import 'package:matma_go/teoria/Pochodne.dart';
import 'package:matma_go/teoria/Pochodne2.dart';
import 'package:matma_go/teoria/Pochodne3.dart';
import 'package:matma_go/teoria/PodstawoweInformacje.dart';
import 'package:matma_go/teoria/SzeregiLiczbowe.dart';
import 'package:matma_go/teoria/SzeregiPrzemienne.dart';
class Teoria extends StatefulWidget {
  @override
  _TeoriaState createState() => _TeoriaState();
}

class _TeoriaState extends State<Teoria> {
  bool pom=false,matematyka=false;

  List items = [['Podstawowe informacje',PodstawoweInformacje()],
    ['Logika', Logika()], ['Nierówności', Nierownosci()],['Ciągi nieskończone', CiagiNiesk()],
    ['Szeregi liczbowe', SzeregiLiczbowe()], ['Kryterium zbieżności', KryteriumZbieznosci()],
    ['SzeregiPrzemienne', SzeregiPrzemienne()], ['Funkcja jednej zmiennej', FunkcjaJednejZmiennej()],
    ['Granice funkcji', GraniceFunkcji()], ['Liczby zespolone część 1', LiczbyZespolone()],
    ['Liczby zespolone część 2', LiczbyZespolone2()],
    ['Pochodne część 1', Pochodne1()], ['Pochodne część 2', Pochodne2()],
    ['Pochodne część 3', Pochodne3()], ['Całki', Calki()],];
  @override
  Widget build(BuildContext context) {
    return matematyka?Matematyka(leftScreen: leftScreen):Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(physics: NeverScrollableScrollPhysics(),shrinkWrap: true, scrollDirection: Axis.vertical,
                    children: items.map((e) => InkWell(child:RaisedButton(child:Text(e[0].toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),),
                        onTap: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => e[1],
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        },splashColor: Colors.grey[900],splashFactory: InkRipple.splashFactory)).toList()),
              ],
            )
          ),
        ),
      )
    );
  }
  void leftScreen(){
    setState((){
      matematyka=false;
    });
  }
}