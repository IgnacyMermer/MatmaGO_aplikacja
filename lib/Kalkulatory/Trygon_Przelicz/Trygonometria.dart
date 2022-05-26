import 'package:flutter/material.dart';
import 'package:matma_go/Kalkulatory/Trygon_Przelicz/KalkTrygonometryczny1.dart';

import 'KalkTrygonometryczny2.dart';
class Trygonometria extends StatefulWidget {
  final Function comeBack;
  Trygonometria({this.comeBack});
  @override
  _TrygonometriaState createState() => _TrygonometriaState();
}

class _TrygonometriaState extends State<Trygonometria> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    List items = [['Kalkulator tr. 1',KalkTrygonometryczny1(comeBack: comeHere), 1], ['Kalkulator tr. 2',KalkTrygonometryczny2(comeBack: comeHere), 2]];
    return index!=0?items[index-1][1]:WillPopScope(
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
              child:SafeArea(
                child: ListView(
                  children: items.map((e) => InkWell(child: Container(width:MediaQuery.of(context).size.width, height: 40,child:Center(child:Text(e[0].toString(),textAlign: TextAlign.center))),
                      onTap: (){
                        setState(() {
                          index=e[2];
                        });
                      },splashColor: Colors.grey,splashFactory: InkRipple.splashFactory)).toList(),
                ),
              ),
            )
        )
    );
  }
  Future<bool> onBackPressed(){
    widget.comeBack();
  }
  void comeHere(){
    setState(()=>index=0);
  }
}
