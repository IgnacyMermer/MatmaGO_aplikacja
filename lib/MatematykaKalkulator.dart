import 'package:flutter/material.dart';
import 'package:matma_go/Kalkulatory/Matematyka/Czworokotaty.dart';
import 'package:matma_go/Kalkulatory/Matematyka/Trojkaty.dart';
import 'package:matma_go/Kalkulatory/Trygon_Przelicz/Trygonometria.dart';
class MatematykaKalkulator extends StatefulWidget {
  final Function leftScreen;
  MatematykaKalkulator({this.leftScreen});
  @override
  _MatematykaKalkulatorState createState() => _MatematykaKalkulatorState();
}
class _MatematykaKalkulatorState extends State<MatematykaKalkulator> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    List items = [['Czworokąty',Czworokaty(comeBack: comeHere), 1], ['Trójkąty',Trojkaty(comeBack: comeHere), 2],
      ['Trygonometria', Trygonometria(comeBack: comeHere),3]];
    return index!=0?items[index-1][1]:WillPopScope(
      onWillPop: onBackPressed,
      child:Scaffold(
        backgroundColor: Colors.blueGrey[700],
        body: Container(
          child:SafeArea(
            child: ListView(
              children:[
                ListView(physics: NeverScrollableScrollPhysics(),shrinkWrap: true, scrollDirection: Axis.vertical,
                  children: items.map((e) => InkWell(child: Container(width:MediaQuery.of(context).size.width, height: 40,child:Center(child:Text(e[0].toString(),textAlign: TextAlign.center))),
                      onTap: (){
                        setState(() {
                          index=e[2];
                        });
                      },splashColor: Colors.grey,splashFactory: InkRipple.splashFactory)).toList())
              ],
            ),
          ),
        )
      )
    );
  }
  Future<bool> onBackPressed(){
    widget.leftScreen();
  }
  void comeHere(){
    setState(()=>index=0);
  }
}