import 'package:flutter/material.dart';
import 'package:matma_go/Kalkulatory/Matematyka/TrojkatRownoboczny.dart';
import 'package:matma_go/Kalkulatory/Matematyka/TrojkatRownoramienny.dart';
class Trojkaty extends StatefulWidget {
  final Function comeBack;
  Trojkaty({this.comeBack});
  @override
  _TrojkatyState createState() => _TrojkatyState();
}
class _TrojkatyState extends State<Trojkaty> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    List items = [['Trójkąt równoboczny',TrojkatRownoboczny(comeBack: comeHere), 1],['Trójkąt równoramienny',TrojkatRownoramienny(comeBack: comeHere), 2]];
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
                      },splashColor: Colors.grey,splashFactory: InkRipple.splashFactory)).toList(),)
              ],
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