import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:math';
class KalkTrygonometryczny2 extends StatefulWidget {
  final Function comeBack;
  KalkTrygonometryczny2({this.comeBack});
  @override
  _KalkTrygonometryczny2State createState() => _KalkTrygonometryczny2State();
}
class _KalkTrygonometryczny2State extends State<KalkTrygonometryczny2> {
  TextEditingController controllerKatA = TextEditingController(),controllerKatB = TextEditingController();
  TextEditingController controllerBokA = TextEditingController(),controllerBokB = TextEditingController();
  TextEditingController controllerBokC = TextEditingController();
  FocusNode focus1,focus2,focus3,focus4,focus5;
  double katA=-1,katB=-1, bokA=-1, bokB=-1, bokC=-1;
  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItems(pierwiastki);
    setDefaultPierwiastki();
    focus1=new FocusNode();
    focus2=new FocusNode();
    focus3=new FocusNode();
    focus4=new FocusNode();
    focus5=new FocusNode();
  }
  @override
  void dispose() {
    super.dispose();
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    focus5.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          child: SafeArea(
            child: ListView(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                        child: Text('Wyczyść wszystko',style: TextStyle(fontSize: 25,color: Colors.black)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color:Colors.grey[400],
                        onPressed:(){
                          setState(() {
                            setDefaultPierwiastki();
                            controllerKatA.text='';
                            controllerKatB.text='';
                            controllerBokA.text='';
                            controllerBokB.text='';
                            controllerBokC.text='';
                            focus1.unfocus();
                            focus2.unfocus();
                            focus3.unfocus();
                            focus4.unfocus();
                            focus5.unfocus();
                          });
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child:Container(
                                  child:TextFormField(
                                    focusNode: focus1,
                                    controller: controllerKatA,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Kąt przy boku A',
                                      hintStyle: TextStyle(color: Colors.grey[700]),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green[900], width: 2.0),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^[\-\d]\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      katA = double.parse(val);
                                      if(val==''){
                                        katA=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                                width: 60,
                                child:Html(data: '<sup>o</sup>',style: {'*':Style(
                                    fontSize: FontSize.xLarge
                                )})
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child:Container(
                                  child:TextFormField(
                                    focusNode: focus2,
                                    controller: controllerKatB,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Kąt przy boku B',
                                      hintStyle: TextStyle(color: Colors.grey[700]),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green[900], width: 2.0),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      katB = double.parse(val);
                                      if(val==''){
                                        katB=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                                width: 60,
                                child:Html(data: '<sup>o</sup>',style: {'*':Style(
                                fontSize: FontSize.xLarge
                                )})
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child:Container(
                                  child:TextFormField(
                                    focusNode: focus3,
                                    controller: controllerBokA,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Bok A',
                                      hintStyle: TextStyle(color: Colors.grey[700]),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green[900], width: 2.0),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      bokA = double.parse(val);
                                      if(val==''){
                                        bokA=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 60,
                              child:DropdownButton(
                                isExpanded: true,
                                value: selectedPierwiastek1,
                                items: _dropdownMenuItems,
                                onChanged: onChangeDropdownItem1,
                                onTap: (){
                                  focus1.unfocus();
                                  focus2.unfocus();
                                  focus3.unfocus();
                                  focus4.unfocus();
                                  focus5.unfocus();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child:Container(
                                  child:TextFormField(
                                    focusNode: focus4,
                                    controller: controllerBokB,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Bok B',
                                      hintStyle: TextStyle(color: Colors.grey[700]),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green[900], width: 2.0),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      bokB = double.parse(val);
                                      if(val==''){
                                        bokB=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 60,
                              child:DropdownButton(
                                isExpanded: true,
                                value: selectedPierwiastek2,
                                items: _dropdownMenuItems,
                                onChanged: onChangeDropdownItem2,
                                onTap: (){
                                  focus1.unfocus();
                                  focus2.unfocus();
                                  focus3.unfocus();
                                  focus4.unfocus();
                                  focus5.unfocus();
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child:Container(
                                  child:TextFormField(
                                    focusNode: focus5,
                                    controller: controllerBokC,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Bok C',
                                      hintStyle: TextStyle(color: Colors.grey[700]),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white,width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green[900], width: 2.0),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      bokC = double.parse(val);
                                      if(val==''){
                                        bokC=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 60,
                              child:DropdownButton(
                                isExpanded: true,
                                value: selectedPierwiastek3,
                                items: _dropdownMenuItems,
                                onChanged: onChangeDropdownItem3,
                                onTap: (){
                                  focus1.unfocus();
                                  focus2.unfocus();
                                  focus3.unfocus();
                                  focus4.unfocus();
                                  focus5.unfocus();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.all(7),
                    child: Container(
                        height: 50,
                        child:RaisedButton(
                          child: Text('Oblicz',style: TextStyle(fontSize: 25,color: Colors.black)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          color:Colors.grey[400],
                          onPressed: (){
                            setState(() {
                              double k1,k2, a, b, c,sinus, cosinus,tangens, cotangens;
                              if(controllerKatA.text!=''&&controllerKatB.text!=''&&controllerBokA.text!=''&&controllerBokB.text!=''&&controllerBokC.text!=''){
                              }
                              else if(controllerBokA.text!=''&&controllerBokB.text!=''&&controllerKatA.text==''&&controllerKatB.text==''&&controllerBokC.text==''){
                                a=bokA*bokA;
                                b=bokB*bokB;
                                c=a+b;
                                c=sqrt(c);
                                sinus = bokB/c;
                                k1 = asin(sinus);
                                k1=k1*180/pi;
                                k2=90-k1;
                                double c2= c/sqrt(2);
                                String x;
                                if(c2.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x=c2.toStringAsFixed(4).split('.')[0];
                                  controllerBokC.text=x;
                                  selectedPierwiastek3=_dropdownMenuItems[1].value;
                                }
                                else{
                                  x = c.toStringAsFixed(6);
                                  controllerBokC.text=przytnijStr(x);
                                }
                                String x1 = k1.toStringAsFixed(6);
                                String x2 = k2.toStringAsFixed(6);
                                controllerKatA.text=przytnijStr(x1);
                                controllerKatB.text=przytnijStr(x2);
                              }
                              else if(controllerBokA.text!=''&&controllerBokC.text!=''&&controllerKatA.text==''&&controllerKatB.text==''&&controllerBokB.text==''){
                                a=bokA*bokA;
                                c=bokC*bokC;
                                b=c-a;
                                b=sqrt(b);
                                sinus = b/bokC;
                                k1 = asin(sinus);
                                k1=k1*180/pi;
                                k2=90-k1;
                                double b2= b/sqrt(2);
                                String x;
                                if(b2.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x=b2.toStringAsFixed(4).split('.')[0];
                                  controllerBokB.text=x;
                                  selectedPierwiastek2=_dropdownMenuItems[1].value;
                                }
                                else{
                                  b2= b/sqrt(3);
                                  if(b2.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x=b2.toStringAsFixed(4).split('.')[0];
                                    controllerBokB.text=x;
                                    selectedPierwiastek2=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x = b.toStringAsFixed(6);
                                    controllerBokB.text = przytnijStr(x);
                                  }
                                }
                                String x1 = k1.toStringAsFixed(6);
                                String x2 = k2.toStringAsFixed(6);
                                controllerKatA.text=przytnijStr(x1);
                                controllerKatB.text=przytnijStr(x2);
                              }
                              else if(controllerBokB.text!=''&&controllerBokC.text!=''&&controllerKatA.text==''&&controllerKatB.text==''&&controllerBokA.text==''){
                                b=bokB*bokB;
                                c=bokC*bokC;
                                a=c-b;
                                a=sqrt(a);
                                sinus = bokB/bokC;
                                k1 = asin(sinus);
                                k1=k1*180/pi;
                                k2=90-k1;
                                double a2= a/sqrt(2);
                                String x;
                                if(a2.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x=a2.toStringAsFixed(4).split('.')[0];
                                  controllerBokA.text=x;
                                  selectedPierwiastek1=_dropdownMenuItems[1].value;
                                }
                                else{
                                  a2= a/sqrt(3);
                                  if(a2.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x=a2.toStringAsFixed(4).split('.')[0];
                                    controllerBokA.text=x;
                                    selectedPierwiastek1=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x = a.toStringAsFixed(6);
                                    controllerBokA.text = przytnijStr(x);
                                  }
                                }
                                String x1 = k1.toStringAsFixed(6);
                                String x2 = k2.toStringAsFixed(6);
                                controllerKatA.text=przytnijStr(x1);
                                controllerKatB.text=przytnijStr(x2);
                              }
                              else if((controllerKatA.text!=''||controllerKatB.text!='')&&controllerBokA.text!=''&&controllerBokB.text==''&&controllerBokC.text==''){
                                if(controllerKatA.text!=''){
                                  k1=katA*pi/180;
                                  k2=90-katA;
                                  String x3 = k2.toStringAsFixed(6);
                                  controllerKatB.text=przytnijStr(x3);
                                }
                                else {
                                  k1=90-katB;
                                  String x3 = k1.toStringAsFixed(6);
                                  controllerKatA.text=przytnijStr(x3);
                                  k1=k1*pi/180;
                                }
                                tangens=tan(k1);
                                b=bokA*tangens;
                                double b2 = b*b;
                                a=bokA*bokA;
                                c=a+b2;
                                c=sqrt(c);
                                double b3= b/sqrt(2);
                                String x;
                                if(b3.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x=b3.toStringAsFixed(4).split('.')[0];
                                  controllerBokB.text=x;
                                  selectedPierwiastek2=_dropdownMenuItems[1].value;
                                }
                                else{
                                  b3= b/sqrt(3);
                                  if(b3.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x=b3.toStringAsFixed(4).split('.')[0];
                                    controllerBokB.text=x;
                                    selectedPierwiastek2=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x = b.toStringAsFixed(6);
                                    controllerBokB.text = przytnijStr(x);
                                  }
                                }
                                double c2= c/sqrt(2);
                                String x1;
                                if(c2.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x1=c2.toStringAsFixed(4).split('.')[0];
                                  controllerBokC.text=x1;
                                  selectedPierwiastek3=_dropdownMenuItems[1].value;
                                }
                                else{
                                  c2= c/sqrt(3);
                                  if(c2.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x1=c2.toStringAsFixed(4).split('.')[0];
                                    controllerBokC.text=x1;
                                    selectedPierwiastek3=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x1 = a.toStringAsFixed(6);
                                    controllerBokC.text = przytnijStr(x1);
                                  }
                                }
                              }
                              else if((controllerKatA.text!=''||controllerKatB.text!='')&&controllerBokB.text!=''&&controllerBokA.text==''&&controllerBokC.text==''){
                                if(controllerKatA.text!=''){
                                  k1=katA*pi/180;
                                  k2=90-katA;
                                  String x3 = k2.toStringAsFixed(6);
                                  controllerKatB.text=przytnijStr(x3);
                                }
                                else {
                                  k1=90-katB;
                                  String x3 = k1.toStringAsFixed(6);
                                  controllerKatA.text=przytnijStr(x3);
                                  k1=k1*pi/180;
                                }
                                tangens=tan(k1);
                                a=bokB/tangens;
                                double a2 = a*a;
                                b=bokB*bokB;
                                c=a2+b;
                                c=sqrt(c);
                                double a3= a/sqrt(2);
                                String x;
                                if(a3.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x=a3.toStringAsFixed(4).split('.')[0];
                                  controllerBokA.text=x;
                                  selectedPierwiastek1=_dropdownMenuItems[1].value;
                                }
                                else{
                                  a3= a/sqrt(3);
                                  if(a3.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x=a3.toStringAsFixed(4).split('.')[0];
                                    controllerBokA.text=x;
                                    selectedPierwiastek1=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x = a.toStringAsFixed(6);
                                    controllerBokA.text = przytnijStr(x);
                                  }
                                }
                                double c2= a/sqrt(2);
                                String x1;
                                if(c2.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x1=c2.toStringAsFixed(4).split('.')[0];
                                  controllerBokC.text=x1;
                                  selectedPierwiastek3=_dropdownMenuItems[1].value;
                                }
                                else{
                                  c2= c/sqrt(3);
                                  if(c2.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x1=c2.toStringAsFixed(4).split('.')[0];
                                    controllerBokC.text=x1;
                                    selectedPierwiastek3=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x1 = c.toStringAsFixed(6);
                                    controllerBokC.text = przytnijStr(x1);
                                  }
                                }
                              }
                              else if((controllerKatA.text!=''||controllerKatB.text!='')&&controllerBokC.text!=''&&controllerBokA.text==''&&controllerBokB.text==''){
                                if(controllerKatA.text!=''){
                                  k1=katA*pi/180;
                                  k2=90-katA;
                                  String x3 = k2.toStringAsFixed(6);
                                  controllerKatB.text=przytnijStr(x3);
                                }
                                else {
                                  k1=90-katB;
                                  String x3 = k1.toStringAsFixed(6);
                                  controllerKatA.text=przytnijStr(x3);
                                  k1=k1*pi/180;
                                }
                                sinus=sin(k1);
                                b=bokC*sinus;
                                double b2 = b*b;
                                c=bokC*bokC;
                                a=c-b2;
                                a=sqrt(a);
                                double a2= a/sqrt(2);
                                String x;
                                if(a2.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x=a2.toStringAsFixed(4).split('.')[0];
                                  controllerBokA.text=x;
                                  selectedPierwiastek1=_dropdownMenuItems[1].value;
                                }
                                else{
                                  a2= a/sqrt(3);
                                  if(a2.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x=a2.toStringAsFixed(4).split('.')[0];
                                    controllerBokA.text=x;
                                    selectedPierwiastek1=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x = a.toStringAsFixed(6);
                                    controllerBokA.text = przytnijStr(x);
                                  }
                                }
                                double b3= b/sqrt(2);
                                String x1;
                                if(b3.toStringAsFixed(4).split('.')[1]=='0000'){
                                  x1=b3.toStringAsFixed(4).split('.')[0];
                                  controllerBokB.text=x1;
                                  selectedPierwiastek2=_dropdownMenuItems[1].value;
                                }
                                else{
                                  b3 = b/sqrt(3);
                                  if(b3.toStringAsFixed(4).split('.')[1]=='0000'){
                                    x1=b3.toStringAsFixed(4).split('.')[0];
                                    controllerBokB.text=x1;
                                    selectedPierwiastek2=_dropdownMenuItems[2].value;
                                  }
                                  else {
                                    x1 = a.toStringAsFixed(6);
                                    controllerBokB.text = przytnijStr(x1);
                                  }
                                }
                              }
                            });
                            focus1.unfocus();
                            focus2.unfocus();
                            focus3.unfocus();
                            focus4.unfocus();
                            focus5.unfocus();
                          },
                        )
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<Pierwiastek> pierwiastki = Pierwiastek.getPierwiastki();
  List<DropdownMenuItem<Pierwiastek>> _dropdownMenuItems;
  Pierwiastek selectedPierwiastek1,selectedPierwiastek2,selectedPierwiastek3;
  List<DropdownMenuItem<Pierwiastek>> buildDropdownMenuItems(List<Pierwiastek> pierwiastek) {
    List<DropdownMenuItem<Pierwiastek>> items = List();
    for (Pierwiastek it in pierwiastek) {
      items.add(
        DropdownMenuItem(
          value: it,
          child: Html(data:it.name),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem1(Pierwiastek selectedPierwiastekPom) {
    setState(() {
      bokA/=selectedPierwiastek1.mnoznik;
      selectedPierwiastek1 = selectedPierwiastekPom;
      bokA*=selectedPierwiastek1.mnoznik;
    });
  }
  onChangeDropdownItem2(Pierwiastek selectedPierwiastekPom) {
    setState(() {
      bokB/=selectedPierwiastek2.mnoznik;
      selectedPierwiastek2 = selectedPierwiastekPom;
      bokB*=selectedPierwiastek2.mnoznik;
    });
  }
  onChangeDropdownItem3(Pierwiastek selectedPierwiastekPom) {
    setState(() {
      bokC/=selectedPierwiastek3.mnoznik;
      selectedPierwiastek3 = selectedPierwiastekPom;
      bokC*=selectedPierwiastek3.mnoznik;
    });
  }

  void setDefaultPierwiastki(){
    selectedPierwiastek1 = _dropdownMenuItems[0].value;
    selectedPierwiastek2 = _dropdownMenuItems[0].value;
    selectedPierwiastek3 = _dropdownMenuItems[0].value;
  }
  String przytnijStr(String pom){
    if(pom[pom.length-1]=='0'){
      pom=pom.substring(0,pom.length-1);
    }
    if(pom[pom.length-1]=='0'){
      pom=pom.substring(0,pom.length-1);
    }
    if(pom[pom.length-1]=='0'){
      pom=pom.substring(0,pom.length-1);
    }
    if(pom[pom.length-1]=='0'){
      pom=pom.substring(0,pom.length-1);
    }
    if(pom[pom.length-1]=='0'){
      pom=pom.substring(0,pom.length-1);
    }
    if(pom[pom.length-1]=='0'){
      pom=pom.substring(0,pom.length-2);
    }
    return pom;
  }
  Future<bool> onBackPressed(){
    widget.comeBack();
  }
}
class Pierwiastek {
  int id;
  String name;
  double mnoznik;
  Pierwiastek(this.id, this.name,this.mnoznik);
  static List<Pierwiastek> getPierwiastki() {
    return <Pierwiastek>[
      Pierwiastek(0, ' ',1),
      Pierwiastek(0, '&#8730;2',sqrt(2)),
      Pierwiastek(1, '&#8730;3',sqrt(3)),
    ];
  }
}