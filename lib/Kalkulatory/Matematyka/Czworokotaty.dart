import 'package:flutter/material.dart';
import 'package:matma_go/Kalkulatory/Matematyka/Prostokat.dart';
import 'package:matma_go/Kalkulatory/Matematyka/Rownoleglobok.dart';
import 'package:matma_go/Kalkulatory/Matematyka/Trapezy.dart';

import 'Kwadrat.dart';
import 'Romb.dart';
class Czworokaty extends StatefulWidget {
  final Function comeBack;
  Czworokaty({this.comeBack});
  @override
  _CzworokatyState createState() => _CzworokatyState();
}
class _CzworokatyState extends State<Czworokaty> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    List items = [['Kwadrat',Kwadrat(comeBack: comeHere), 1],['Prostokąt',Prostokat(comeBack: comeHere),2],
      ['Romb',Romb(comeBack: comeHere),3],['Równoległobok', Rownoleglobok(comeBack: comeHere),4],["Trapezy", Trapezy(comeBack: comeHere),5]];
    return index!=0?items[index-1][1]:WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
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
              children:[
                ListView(physics: NeverScrollableScrollPhysics(),shrinkWrap: true, scrollDirection: Axis.vertical,
                  children: items.map((e) => InkWell(child: Container(width:MediaQuery.of(context).size.width, height: 40,child:Center(child:Text(e[0].toString(),textAlign: TextAlign.center))),
                      onTap: (){
                        setState(() {
                          index=e[2];
                        });
                      },splashColor: Colors.grey,splashFactory: InkRipple.splashFactory)).toList(),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> onBackPressed(){
    widget.comeBack();
  }
  void comeHere(){
    setState(()=>index=0);
  }
}