import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
class KalkTrygonometryczny1 extends StatefulWidget {
  final Function comeBack;
  KalkTrygonometryczny1({this.comeBack});
  @override
  _KalkTrygonometryczny1State createState() => _KalkTrygonometryczny1State();
}
class _KalkTrygonometryczny1State extends State<KalkTrygonometryczny1> {
  TextEditingController controllerKat = TextEditingController(),controllerSinus = TextEditingController();
  TextEditingController controllerCosinus = TextEditingController(),controllerTangens = TextEditingController();
  TextEditingController controllerCotangens = TextEditingController();
  FocusNode focus1,focus2,focus3,focus4,focus5;
  double kat=-1,sinus=-1, cosinus=-1, tangens=-1, cotangens=-1;
  @override
  void initState() {
    super.initState();
    print('sth2');
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
                          controllerKat.text='';
                          controllerSinus.text='';
                          controllerCosinus.text='';
                          controllerTangens.text='';
                          controllerCotangens.text='';
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
                                    controller: controllerKat,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Kąt',
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
                                      kat = double.parse(val);
                                      if(val==''){
                                        kat=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 60,
                              child:Html(data: '<sup>o</sup>',style: {'*':Style(
                                fontSize: FontSize.xLarge
                              )},)
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
                                    controller: controllerSinus,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Sinus',
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
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\-\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      sinus = double.parse(val);
                                      if(val==''){
                                        sinus=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                                width: 60,
                                child:Html(data: ' ',)
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
                                    controller: controllerCosinus,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Cosinus',
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
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\-\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      cosinus = double.parse(val);
                                      if(val==''){
                                        cosinus=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                                width: 60,
                                child:Html(data: ' ',)
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
                                    controller: controllerTangens,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Tangens',
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
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\-\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      tangens = double.parse(val);
                                      if(val==''){
                                        tangens=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                                width: 60,
                                child:Html(data: ' ',)
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
                                    focusNode: focus5,
                                    controller: controllerCotangens,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Cotangens',
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
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\-\d*[\.\,]?\d*)'))],
                                    onChanged: (val) => setState((){
                                      val = val.replaceAll(',','.');
                                      cotangens = double.parse(val);
                                      if(val==''){
                                        cotangens=-1;
                                      }
                                    }),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                                width: 60,
                                child:Html(data: ' ',)
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
                          double k, sinu, cosi, tang, ctge;
                          if(controllerKat.text!=''&&controllerSinus.text!=''&&controllerCosinus.text!=''&&controllerTangens.text!=''&&controllerCotangens.text!=''){
                          }
                          else if(controllerKat.text!=''){
                            k=kat*pi/180;
                            sinu = sin(k);
                            cosi = cos(k);
                            tang = tan(k);
                            ctge = 1/tan(k);
                            String x = sinu.toStringAsFixed(6);
                            String x1 = cosi.toStringAsFixed(6);
                            String x2 = tang.toStringAsFixed(6);
                            String x3 = ctge.toStringAsFixed(6);
                            controllerSinus.text = przytnijStr(x);
                            controllerCosinus.text=przytnijStr(x1);
                            controllerTangens.text=tang<1000&&tang!=double.infinity&&tang>-1000?przytnijStr(x2):'-';
                            controllerCotangens.text=ctge<1000&&ctge!=double.infinity&&ctge>-1000?przytnijStr(x3):'-';
                          }
                          else if(controllerSinus.text!=''){
                            k=asin(sinus);
                            cosi = cos(k);
                            tang = tan(k);
                            ctge=1/tan(k);
                            k=k*180/pi;
                            String x = k.toStringAsFixed(6);
                            String x1 = cosi.toStringAsFixed(6);
                            String x2 = tang.toStringAsFixed(6);
                            String x3 = ctge.toStringAsFixed(6);
                            controllerKat.text = przytnijStr(x);
                            controllerCosinus.text=przytnijStr(x1);
                            controllerTangens.text=tang<1000&&tang!=double.infinity&&tang>-1000?przytnijStr(x2):'-';
                            controllerCotangens.text=ctge<1000&&ctge!=double.infinity&&ctge>-1000?przytnijStr(x3):'-';
                          }
                          else if(controllerCosinus.text!=''){
                            k=acos(cosinus);
                            sinu = sin(k);
                            tang = tan(k);
                            ctge=1/tan(k);
                            k=k*180/pi;
                            String x = k.toStringAsFixed(6);
                            String x1 = sinu.toStringAsFixed(6);
                            String x2 = tang.toStringAsFixed(6);
                            String x3 = ctge.toStringAsFixed(6);
                            controllerKat.text = przytnijStr(x);
                            controllerSinus.text=przytnijStr(x1);
                            controllerTangens.text=tang<1000&&tang!=double.infinity&&tang>-1000?przytnijStr(x2):'-';
                            controllerCotangens.text=ctge<1000&&ctge!=double.infinity&&ctge>-1000?przytnijStr(x3):'-';
                          }
                          else if(controllerTangens.text!=''){
                            k=atan(tangens);
                            sinu= sin(k);
                            cosi = cos(k);
                            ctge=1/tangens;
                            k=k*180/pi;
                            String x = k.toStringAsFixed(6);
                            String x1 = sinu.toStringAsFixed(6);
                            String x2 = cosi.toStringAsFixed(6);
                            String x3 = ctge.toStringAsFixed(6);
                            controllerKat.text = przytnijStr(x);
                            controllerSinus.text=przytnijStr(x1);
                            controllerCosinus.text=przytnijStr(x2);
                            controllerCotangens.text=ctge<1000&&ctge!=double.infinity&&ctge>-1000?przytnijStr(x3):'-';
                          }
                          else if(controllerCotangens.text!=''){
                            k=atan(cotangens);
                            sinu= sin(k);
                            cosi = cos(k);
                            tang=1/cotangens;
                            k=k*180/pi;
                            String x = k.toStringAsFixed(6);
                            String x1 = sinu.toStringAsFixed(6);
                            String x2 = cosi.toStringAsFixed(6);
                            String x3 = tang.toStringAsFixed(6);
                            controllerKat.text = przytnijStr(x);
                            controllerSinus.text=przytnijStr(x1);
                            controllerCosinus.text=przytnijStr(x2);
                            controllerTangens.text=tang<1000&&tang!=double.infinity&&tang>-1000?przytnijStr(x3):'-';
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
