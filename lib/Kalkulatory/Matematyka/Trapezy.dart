import 'package:flutter/material.dart';
import 'package:matma_go/Kalkulatory/Matematyka/TrapezProstokatny.dart';
import 'package:matma_go/Kalkulatory/Matematyka/TrapezRownoramienny.dart';
class Trapezy extends StatefulWidget {
  final Function comeBack;
  Trapezy({this.comeBack});
  @override
  _TrapezyState createState() => _TrapezyState();
}
class _TrapezyState extends State<Trapezy> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    List items = [['Trapez równoramienny',TrapezRownoramienny(comeBack: comeHere), 1],['Trapez prostokątny',TrapezProstokatny(comeBack: comeHere), 2]];
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
                  children: items.map((e) => InkWell(child: Container(width:double.infinity, height: 40,child:Center(child:Text(e[0].toString(),textAlign: TextAlign.center))),
                      onTap: (){
                        setState(() {
                          index=e[2];
                        });
                      },splashColor: Colors.grey,splashFactory: InkRipple.splashFactory)).toList(),)
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