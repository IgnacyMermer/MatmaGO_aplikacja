import 'package:flutter/material.dart';
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
class Matematyka extends StatefulWidget {
  final Function leftScreen;
  Matematyka({this.leftScreen});
  @override
  _MatematykaState createState() => _MatematykaState();
}
class _MatematykaState extends State<Matematyka> {
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
    return WillPopScope(
      onWillPop: onBackPressed,
      child:Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          leading:IconButton(
            splashRadius: 20,
            icon: Icon(Icons.arrow_back),
            splashColor: Colors.black12,
            onPressed: (){
              onBackPressed();
            }
          ),
        ),
        body: Container(
          color: Colors.red,
          child:SafeArea(
            child: ListView(
              children:[
                ListView(physics: NeverScrollableScrollPhysics(),shrinkWrap: true, scrollDirection: Axis.vertical,
                    children: items.map((e) => InkWell(child: Container(width:MediaQuery.of(context).size.width, height: 35,color: Colors.grey[800],
                        child:RaisedButton(child:Text(e[0].toString(),textAlign: TextAlign.center))),
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => e[1],
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  },splashColor: Colors.grey,splashFactory: InkRipple.splashFactory)).toList()),
              ]
            ),
          ),
        )
      )
    );
  }
  Future<bool> onBackPressed(){
    widget.leftScreen();
  }
}