import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart';
import 'dart:math';
class Romb extends StatefulWidget {
  final Function comeBack;
  Romb({this.comeBack});
  @override
  _RombState createState() => _RombState();
}

class _RombState extends State<Romb> {
  double bok=-1, przekatnaA=-1, przekatnaB=-1, pole=-1, obwod=-1,katA=-1,katB=-1,wysokosc=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerBok = TextEditingController(),controllerPrzekatnaA = TextEditingController();
  TextEditingController controllerPrzekatnaB = TextEditingController(),controllerWysokosc=TextEditingController();
  TextEditingController controllerKatA = TextEditingController(),controllerKatB = TextEditingController();
  FocusNode focus1,focus2,focus3,focus4,focus5,focus6,focus7,focus8;
  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItems(jednostkas);
    _dropdownMenuItems2 = buildDropdownMenuItems2(jednostkas2);
    setDefaultJednostkas();
    focus1=new FocusNode();
    focus2=new FocusNode();
    focus3=new FocusNode();
    focus4=new FocusNode();
    focus5=new FocusNode();
    focus6=new FocusNode();
    focus7=new FocusNode();
    focus8=new FocusNode();
  }
  @override
  void dispose() {
    super.dispose();
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    focus5.dispose();
    focus6.dispose();
    focus7.dispose();
    focus8.dispose();
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
          child:SafeArea(
              child: ListView(
                children: [
                  SizedBox(height: 14),
                  Padding(
                    padding: EdgeInsets.all(7),
                    child: Container(
                      height: 50,
                      child:RaisedButton(
                        child: Text('Wyczyść wszystko',style: TextStyle(fontSize: 25,color: Colors.black)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color:Colors.grey[400],
                        onPressed: (){
                          setState(() {
                            controllerBok=new TextEditingController();
                            controllerObwod=new TextEditingController();
                            controllerPole=new TextEditingController();
                            controllerPrzekatnaA=new TextEditingController();
                            controllerPrzekatnaB=new TextEditingController();
                            controllerKatA=new TextEditingController();
                            controllerKatB=new TextEditingController();
                            controllerWysokosc=new TextEditingController();
                            bok=-1;
                            obwod=-1;
                            pole=-1;
                            przekatnaA=-1;
                            przekatnaB=-1;
                            katA=-1;
                            katB=-1;
                            wysokosc=-1;
                            pierwszaLinia='';
                            drugaLinia='';
                            trzeciaLinia='';
                            czwartaLinia='';
                            wynik='';
                            setDefaultJednostkas();
                          });
                        },
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                  child:TextFormField(
                                    focusNode: focus1,
                                    controller: controllerBok,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Bok',
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
                                      bok = double.parse(val);
                                      bok*=selectedJednostka1.mnoznik;
                                      if(val==''){
                                        bok=-1;
                                      }
                                    }),
                                  )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka1,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem1,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                  },
                                ),
                              ),

                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus2,
                                      controller: controllerPrzekatnaA,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Krótsza przekątna',
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
                                        przekatnaA = double.parse(val);
                                        przekatnaA*=selectedJednostka2.mnoznik;
                                        if(val==''){
                                          przekatnaA=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka2,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem2,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus3,
                                      controller: controllerPrzekatnaB,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Dłuższa przekątna',
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
                                        przekatnaB = double.parse(val);
                                        przekatnaB*=selectedJednostka3.mnoznik;
                                        if(val==''){
                                          przekatnaB=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka3,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem3,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                  child:TextFormField(
                                    focusNode: focus4,
                                    controller: controllerObwod,
                                    style: TextStyle(fontSize: 22,color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Obwód',
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
                                      obwod = double.parse(val);
                                      obwod*=selectedJednostka4.mnoznik;
                                      if(val==''){
                                        obwod=-1;
                                      }
                                    }),
                                  )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka4,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem4,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus5,
                                      controller: controllerPole,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Pole',
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
                                        pole = double.parse(val);
                                        pole*=selectedJednostka5.mnoznik;
                                        if(val.toString()==''){
                                          pole=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 80,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka5,
                                  items: _dropdownMenuItems2,
                                  onChanged: onChangeDropdownItem5,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus6,
                                      controller: controllerWysokosc,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Wysokość',
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
                                        wysokosc = double.parse(val);
                                        wysokosc*=selectedJednostka6.mnoznik;
                                        if(val==''){
                                          wysokosc=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka6,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem6,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus7,
                                      controller: controllerKatA,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Kąt ostry',
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
                                child:Html(data: '<sup>o</sup>'),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus8,
                                      controller: controllerKatB,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Kąt rozwarty',
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
                                child:Html(data: '<sup>o</sup>'),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 20),
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
                          focus1.unfocus();
                          focus2.unfocus();
                          focus3.unfocus();
                          focus4.unfocus();
                          focus5.unfocus();
                          focus6.unfocus();
                          focus7.unfocus();
                          focus8.unfocus();
                          setState(() {
                            double a,d,ob,p,kat,sinus,cosinus,tanges,h,d1,d2,kat1,kat2;
                            if(controllerBok.text!=''&&controllerWysokosc.text!=''){
                              whatWasWrote='bokWysokosc';
                              p = bok*wysokosc;
                              ob=4*bok;
                              ob/=selectedJednostka4.mnoznik;
                              String x2=ob.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x2);
                              p/=selectedJednostka5.mnoznik;
                              String x=p.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                            }
                            else if(controllerObwod.text!=''&&controllerWysokosc.text!=''){
                              whatWasWrote='obwodWysokosc';
                              a=obwod/4;
                              p = a*wysokosc;
                              p/=selectedJednostka5.mnoznik;
                              a/=selectedJednostka1.mnoznik;
                              String x=p.toStringAsFixed(11);
                              String x2=ob.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerPrzekatnaB.text!=''&&controllerPole.text!=''){
                              whatWasWrote='przekatnaAprzekatnaBPole';
                              d1=przekatnaA/2;
                              d2 = przekatnaB/2;
                              d1*=d1;
                              d2*=d2;
                              d1+=d2;
                              a=sqrt(d1);
                              ob=4*a;
                              ob/=selectedJednostka4.mnoznik;
                              d1 = przekatnaA/2;
                              d2 = przekatnaB/2;
                              tanges=d1/d2;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              String x3=ob.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x3);
                              a/=selectedJednostka1.mnoznik;
                              String x2=a.toStringAsFixed(11);
                              controllerBok.text=przytnijStr(x2);
                              h = pole/a;

                              String x=h.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x);
                              String x4=kat1.toStringAsFixed(11);
                              String x5 = kat2.toStringAsFixed(11);
                              controllerKatA.text=przytnijStr(x4);
                              controllerKatB.text=przytnijStr(x5);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerPrzekatnaB.text!=''&&controllerBok.text!=''){
                              whatWasWrote='przekatnaAprzekatnaBBok';
                              p = przekatnaA*przekatnaB;
                              h = p/bok;

                              p/=selectedJednostka5.mnoznik;
                              ob=4*bok;
                              ob/=selectedJednostka4.mnoznik;
                              d1 = przekatnaA/2;
                              d2 = przekatnaB/2;
                              tanges=d1/d2;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              String x3=ob.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x3);
                              String x=p.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                              String x2=h.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x2);
                              String x4=kat1.toStringAsFixed(11);
                              String x5 = kat2.toStringAsFixed(11);
                              controllerKatA.text=przytnijStr(x4);
                              controllerKatB.text=przytnijStr(x5);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerPrzekatnaB.text!=''&&controllerObwod.text!=''){
                              whatWasWrote='przekatnaAprzekatnaBbok';
                              a=obwod/4;
                              p = przekatnaA*przekatnaB;
                              h = p/a;

                              p/=selectedJednostka5.mnoznik;
                              d1 = przekatnaA/2;
                              d2 = przekatnaB/2;
                              tanges=d1/d2;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              a/=selectedJednostka1.mnoznik;
                              String x=p.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                              String x2=h.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x2);
                              String x3=a.toStringAsFixed(11);
                              String x4=kat1.toStringAsFixed(11);
                              String x5 = kat2.toStringAsFixed(11);
                              controllerBok.text=przytnijStr(x3);
                              controllerKatA.text=przytnijStr(x4);
                              controllerKatB.text=przytnijStr(x5);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerPrzekatnaB.text!=''){
                              whatWasWrote='przekatnaAprzekatnaB';
                              p = przekatnaA*przekatnaB/2;
                              d1=przekatnaA/2;
                              d2 = przekatnaB/2;
                              d1=d1*d1;
                              d2=d2*d2;
                              d1+=d2;
                              a=sqrt(d1);
                              ob=4*a;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              p/=selectedJednostka5.mnoznik;
                              d1 = przekatnaA/2;
                              d2 = przekatnaB/2;
                              tanges=d1/d2;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              String x=p.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3=ob.toStringAsFixed(11);
                              String x4=kat1.toStringAsFixed(11);
                              String x5 = kat2.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerObwod.text=przytnijStr(x3);
                              controllerKatA.text=przytnijStr(x4);
                              controllerKatB.text=przytnijStr(x5);
                            }
                            else if(controllerBok.text!=''&&controllerKatA.text!=''){
                              whatWasWrote='bokKatA';
                              kat=katA>=180?180-katA:katA;
                              kat = kat*pi/180;
                              sinus=sin(kat);
                              cosinus=cos(kat);
                              p = bok*bok*sinus;
                              h = p/bok;
                              d2 = 2*a*cosinus;
                              d1 = 2*a*sinus;
                              d1/=selectedJednostka2.mnoznik;
                              d2/=selectedJednostka3.mnoznik;

                              p/=selectedJednostka5.mnoznik;
                              ob=4*bok;
                              kat2=180-katA;
                              ob/=selectedJednostka4.mnoznik;
                              String x3=ob.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x3);
                              String x=p.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                              String x2=h.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x2);
                              String x4=d1.toStringAsFixed(11);
                              controllerPrzekatnaA.text=przytnijStr(x4);
                              String x5=d1.toStringAsFixed(11);
                              controllerPrzekatnaB.text=przytnijStr(x5);
                              String x6=kat2.toStringAsFixed(11);
                              controllerKatB.text=przytnijStr(x6);
                            }
                            else if(controllerObwod.text!=''&&controllerKatA.text!=''){
                              whatWasWrote='bokKatA';
                              kat=katA>=180?180-katA:katA;
                              kat = kat*pi/180;
                              sinus=sin(kat);
                              cosinus=cos(kat);
                              a=obwod/4;
                              p = a*a*sinus;
                              h = p/a;
                              d2 = 2*a*cosinus;
                              d1 = 2*a*sinus;
                              d1/=selectedJednostka2.mnoznik;
                              d2/=selectedJednostka3.mnoznik;

                              p/=selectedJednostka5.mnoznik;
                              kat2=180-katA;
                              ob/=selectedJednostka4.mnoznik;
                              a/=selectedJednostka1.mnoznik;
                              String x=p.toStringAsFixed(11);
                              String x2=h.toStringAsFixed(11);
                              String x3=a.toStringAsFixed(11);
                              String x4=d1.toStringAsFixed(11);
                              String x5=d1.toStringAsFixed(11);
                              String x6=kat2.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                              controllerWysokosc.text=przytnijStr(x2);
                              controllerBok.text=przytnijStr(x3);
                              controllerPrzekatnaA.text=przytnijStr(x4);
                              controllerPrzekatnaB.text=przytnijStr(x5);
                              controllerKatB.text=przytnijStr(x6);
                            }
                            else if(controllerPrzekatnaB.text!=''&&controllerKatA.text!=''){
                              whatWasWrote='przekatnaBkatA';
                              kat=katA>=180?180-katA:katA;
                              kat = kat*pi/180;
                              cosinus=cos(kat);
                              d1=przekatnaB/2;
                              a=d1/cosinus;
                              ob=4*a;
                              tanges=tan(kat);
                              d1 = d2*tanges*2;
                              kat2=180-katA;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              d1/=selectedJednostka2.mnoznik;
                              String x=ob.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3=d1.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerPrzekatnaA.text=przytnijStr(x3);
                              String x4=kat2.toStringAsFixed(11);
                              controllerKatB.text=przytnijStr(x4);
                            }
                            else if(controllerPrzekatnaB.text!=''&&controllerKatB.text!=''){
                              whatWasWrote='przekatnaBkatB';
                              kat=katB>=180?180-katB:katB;
                              kat/=2;
                              kat = kat*pi/180;
                              cosinus=cos(kat);
                              d2=przekatnaB/2;
                              a=d2/cosinus;
                              ob=4*a;
                              tanges=tan(kat);
                              d1 = d2*tanges*2;
                              kat1=180-katB;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              d1/=selectedJednostka2.mnoznik;
                              String x=ob.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3=d1.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerPrzekatnaA.text=przytnijStr(x3);
                              String x4=kat1.toStringAsFixed(11);
                              controllerKatA.text=przytnijStr(x4);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerKatA.text!=''){
                              whatWasWrote='przekatnaAkatA';
                              kat=katA>=180?180-katA:katA;
                              kat/=2;
                              kat = kat*pi/180;
                              sinus=cos(kat);
                              d1=przekatnaA/2;
                              a=d1/sinus;
                              ob=4*a;
                              tanges=tan(kat);
                              d2 = d1*tanges*2;
                              kat2=180-katA;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              d2/=selectedJednostka3.mnoznik;
                              String x=ob.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3=d2.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerPrzekatnaB.text=przytnijStr(x3);
                              String x4=kat2.toStringAsFixed(11);
                              controllerKatB.text=przytnijStr(x4);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerKatB.text!=''){
                              whatWasWrote='przekatnaAkatB';
                              kat=katB>=180?180-katB:katB;
                              kat/=2;
                              kat = kat*pi/180;
                              sinus=sin(kat);
                              d1=przekatnaA/2;
                              a=d1/sinus;
                              ob=4*a;
                              tanges=tan(kat);
                              d2 = d1*tanges*2;
                              d1=180-katB;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              d2/=selectedJednostka3.mnoznik;
                              String x=ob.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3=d2.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerPrzekatnaB.text=przytnijStr(x3);
                              String x4=kat1.toStringAsFixed(11);
                              controllerKatA.text=przytnijStr(x4);
                            }
                            else if(controllerBok.text!=''&&controllerKatB.text!=''){
                              whatWasWrote='bokKatB';
                              kat=katB>=180?180-katB:katB;
                              kat/=2;
                              kat = kat*pi/180;
                              sinus=sin(kat);
                              cosinus=cos(kat);
                              p = bok*bok*sinus;
                              h = p/bok;
                              d2 = 2*a*cosinus;
                              d1 = 2*a*sinus;
                              d1/=selectedJednostka2.mnoznik;
                              d2/=selectedJednostka3.mnoznik;

                              p/=selectedJednostka5.mnoznik;
                              ob=4*bok;
                              ob/=selectedJednostka4.mnoznik;
                              kat1=180-katB;
                              String x3=ob.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x3);
                              String x=p.toStringAsFixed(11);
                              controllerPole.text=przytnijStr(x);
                              String x2=h.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x2);
                              String x4=d1.toStringAsFixed(11);
                              controllerPrzekatnaA.text=przytnijStr(x4);
                              String x5=d1.toStringAsFixed(11);
                              controllerPrzekatnaB.text=przytnijStr(x5);
                              String x6=kat1.toStringAsFixed(11);
                              controllerKatA.text=przytnijStr(x6);
                            }
                            else if(controllerBok.text!=''&&controllerPole.text!=''){
                              whatWasWrote='bokPole';
                              h = pole/bok;

                              ob=4*bok;
                              ob/=selectedJednostka4.mnoznik;
                              String x2=ob.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x2);
                              String x=h.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x);
                            }
                            else if(controllerObwod.text!=''&&controllerKatB.text!=''){
                              whatWasWrote='bokKatB';
                              kat=katB>=180?180-katB:katB;
                              kat/=2;
                              kat = kat*pi/180;
                              sinus=sin(kat);
                              cosinus=cos(kat);
                              a=obwod/4;
                              p = a*a*sinus;
                              h = p/a;
                              d2 = 2*a*cosinus;
                              d1 = 2*a*sinus;
                              d1/=selectedJednostka2.mnoznik;
                              d2/=selectedJednostka3.mnoznik;

                              p/=selectedJednostka5.mnoznik;
                              kat1=180-katB;
                              a/=selectedJednostka1.mnoznik;
                              String x=p.toStringAsFixed(11);
                              String x2=h.toStringAsFixed(11);
                              String x3=a.toStringAsFixed(11);
                              String x4=d1.toStringAsFixed(11);
                              String x5=d1.toStringAsFixed(11);
                              String x6=kat1.toStringAsFixed(11);
                              controllerBok.text=przytnijStr(x3);
                              controllerPole.text=przytnijStr(x);
                              controllerWysokosc.text=przytnijStr(x2);
                              controllerPrzekatnaA.text=przytnijStr(x4);
                              controllerPrzekatnaB.text=przytnijStr(x5);
                              controllerKatA.text=przytnijStr(x6);
                            }
                            else if(controllerPole.text!=''&&controllerWysokosc.text!=''){
                              whatWasWrote='poleWysokosc';
                              a = pole/wysokosc;
                              ob=4*a;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              String x2=ob.toStringAsFixed(11);
                              String x=a.toStringAsFixed(11);
                              controllerBok.text=przytnijStr(x);
                              controllerObwod.text=przytnijStr(x2);
                            }
                            else if(controllerObwod.text!=''&&controllerPole.text!=''){
                              whatWasWrote='obwodPole';
                              a=obwod/4;
                              ob=4*a;
                              h = pole/a;

                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              String x=h.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3 = ob.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerObwod.text=przytnijStr(x3);
                            }
                            else if(controllerPole.text!=''&&controllerKatA.text!=''){
                              whatWasWrote='poleKatA';
                              kat=katA>=180?180-katA:katA;
                              kat = kat*pi/180;
                              sinus=sin(kat);
                              a=pole/sinus;
                              ob=4*a;
                              h = pole/a;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;

                              String x=h.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3 = ob.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerObwod.text=przytnijStr(x3);
                            }
                            else if(controllerPole.text!=''&&controllerKatB.text!=''){
                              whatWasWrote='poleKatB';
                              kat=katB>=180?180-katB:katB;
                              kat = kat*pi/180;
                              sinus=sin(kat);
                              a=pole/sinus;
                              ob=4*a;
                              h = pole/a;

                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              kat1=180-katB;
                              String x=h.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3 = ob.toStringAsFixed(11);
                              controllerWysokosc.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerObwod.text=przytnijStr(x3);
                              String x4=kat2.toStringAsFixed(11);
                              controllerKatB.text=przytnijStr(x4);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerPole.text!=''){
                              whatWasWrote='przekatnaApole';
                              d2=pole*2/przekatnaA;
                              double d1a=przekatnaA/2;
                              double d2a = d2/2;
                              d1a=d1a*d1a;
                              d2a=d2a*d2a;
                              d1a+=d2a;
                              a=sqrt(d1a);
                              ob=4*a;
                              d1a = przekatnaA/2;
                              d2a = d2/2;
                              tanges=d1a/d2a;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              d2/=selectedJednostka3.mnoznik;
                              String x=a.toStringAsFixed(11);
                              String x2=d2.toStringAsFixed(11);
                              String x3=ob.toStringAsFixed(11);
                              String x4 = kat1.toStringAsFixed(11);
                              String x5 = kat2.toStringAsFixed(11);
                              controllerBok.text=przytnijStr(x);
                              controllerPrzekatnaB.text=przytnijStr(x2);
                              controllerObwod.text=przytnijStr(x3);
                              controllerKatA.text=przytnijStr(x4);
                              controllerKatB.text=przytnijStr(x5);
                            }
                            else if(controllerPrzekatnaB.text!=''&&controllerPole.text!=''){
                              whatWasWrote='przekatnaBpole';
                              d1=pole*2/przekatnaB;
                              double d2a=przekatnaB/2;
                              double d1a = d1/2;
                              d1a=d1a*d1a;
                              d2a=d2a*d2a;
                              d1a+=d2a;
                              a=sqrt(d1a);
                              ob=4*a;
                              d1a = d1/2;
                              d2a = przekatnaB/2;
                              tanges=d1a/d2a;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              a/=selectedJednostka1.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              d1/=selectedJednostka2.mnoznik;
                              String x=a.toStringAsFixed(11);
                              String x2=d1.toStringAsFixed(11);
                              String x3=ob.toStringAsFixed(11);
                              String x4 = kat1.toStringAsFixed(11);
                              String x5 = kat2.toStringAsFixed(11);
                              controllerBok.text=przytnijStr(x);
                              controllerPrzekatnaA.text=przytnijStr(x2);
                              controllerObwod.text=przytnijStr(x3);
                              controllerKatA.text=przytnijStr(x4);
                              controllerKatB.text=przytnijStr(x5);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerBok.text!=''){
                              whatWasWrote='przekatnaAbok';
                              a=bok*bok;
                              d1=przekatnaA/2;
                              d1*=d1;
                              d2=a-d1;
                              d2=sqrt(d2);
                              d2*=2;
                              p=przekatnaA*d2/2;
                              ob=4*bok;
                              h=p/bok;
                              double d1a = przekatnaA/2;
                              double d2a = d2/2;
                              tanges=d1a/d2a;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              h/=selectedJednostka6.mnoznik;
                              d2/=selectedJednostka3.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              p/=selectedJednostka5.mnoznik;
                              String x= d2.toStringAsFixed(11);
                              String x2=ob.toStringAsFixed(11);
                              String x3 = p.toStringAsFixed(11);
                              String x4=h.toStringAsFixed(11);
                              String x5 = kat1.toStringAsFixed(11);
                              String x6 = kat2.toStringAsFixed(11);
                              controllerPrzekatnaB.text=przytnijStr(x);
                              controllerObwod.text=przytnijStr(x2);
                              controllerPole.text=przytnijStr(x3);
                              controllerWysokosc.text=przytnijStr(x4);
                              controllerKatA.text=przytnijStr(x5);
                              controllerKatB.text=przytnijStr(x6);
                            }
                            else if(controllerPrzekatnaB.text!=''&&controllerBok.text!=''){
                              whatWasWrote='przekatnaBbok';
                              a=bok*bok;
                              d2=przekatnaB/2;
                              d2*=d2;
                              d1=a-d2;
                              d1=sqrt(d1);
                              d1*=2;
                              p=przekatnaB*d1/2;
                              ob=4*bok;
                              h=p/bok;
                              double d1a = d1/2;
                              double d2a = przekatnaB/2;
                              tanges=d1a/d2a;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              h/=selectedJednostka6.mnoznik;
                              d1/=selectedJednostka2.mnoznik;
                              ob/=selectedJednostka4.mnoznik;
                              p/=selectedJednostka5.mnoznik;
                              String x= d1.toStringAsFixed(11);
                              String x2=ob.toStringAsFixed(11);
                              String x3 = p.toStringAsFixed(11);
                              String x4=h.toStringAsFixed(11);
                              String x5 = kat1.toStringAsFixed(11);
                              String x6 = kat2.toStringAsFixed(11);
                              controllerPrzekatnaA.text=przytnijStr(x);
                              controllerObwod.text=przytnijStr(x2);
                              controllerPole.text=przytnijStr(x3);
                              controllerWysokosc.text=przytnijStr(x4);
                              controllerKatA.text=przytnijStr(x5);
                              controllerKatB.text=przytnijStr(x6);
                            }
                            else if(controllerPrzekatnaA.text!=''&&controllerObwod.text!=''){
                              whatWasWrote='przekatnaAbok';
                              a=obwod/4;
                              double a2=a*a;
                              d1=przekatnaA/2;
                              d1*=d1;
                              d2=a2-d1;
                              d2=sqrt(d2);
                              d2*=2;
                              p=przekatnaA*d2/2;
                              h=p/bok;
                              double d1a = przekatnaA/2;
                              double d2a = d2/2;
                              tanges=d1a/d2a;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              d2/=selectedJednostka3.mnoznik;
                              a/=selectedJednostka1.mnoznik;
                              p/=selectedJednostka5.mnoznik;
                              h/=selectedJednostka6.mnoznik;
                              String x= d2.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3 = p.toStringAsFixed(11);
                              String x4=h.toStringAsFixed(11);
                              String x5 = kat1.toStringAsFixed(11);
                              String x6 = kat2.toStringAsFixed(11);
                              controllerPrzekatnaB.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerPole.text=przytnijStr(x3);
                              controllerWysokosc.text=przytnijStr(x4);
                              controllerKatA.text=przytnijStr(x5);
                              controllerKatB.text=przytnijStr(x6);
                            }
                            else if(controllerPrzekatnaB.text!=''&&controllerObwod.text!=''){
                              whatWasWrote='przekatnaBbok';
                              a=obwod/4;
                              double a2=a*a;
                              d2=przekatnaB/2;
                              d2*=d2;
                              d1=a2-d2;
                              d1=sqrt(d1);
                              d1*=2;
                              p=przekatnaB*d1/2;
                              h=p/bok;
                              double d1a = d1/2;
                              double d2a = przekatnaB/2;
                              tanges=d1a/d2a;
                              kat1 = atan(tanges);
                              kat1=kat1*180/pi;
                              kat1*=2;
                              kat2=180-kat1;
                              d1/=selectedJednostka2.mnoznik;
                              a/=selectedJednostka1.mnoznik;
                              p/=selectedJednostka5.mnoznik;
                              h/=selectedJednostka6.mnoznik;
                              String x= d1.toStringAsFixed(11);
                              String x2=a.toStringAsFixed(11);
                              String x3 = p.toStringAsFixed(11);
                              String x4=h.toStringAsFixed(11);
                              String x5 = kat1.toStringAsFixed(11);
                              String x6 = kat2.toStringAsFixed(11);
                              controllerPrzekatnaA.text=przytnijStr(x);
                              controllerBok.text=przytnijStr(x2);
                              controllerPole.text=przytnijStr(x3);
                              controllerWysokosc.text=przytnijStr(x4);
                              controllerKatA.text=przytnijStr(x5);
                              controllerKatB.text=przytnijStr(x6);
                            }
                            else if(controllerObwod.text!=''){
                              whatWasWrote='obwod';
                              a=obwod/4;
                              a/=selectedJednostka1.mnoznik;
                              String x2=a.toStringAsFixed(11);
                              controllerBok.text=przytnijStr(x2);
                            }
                            else if(controllerBok.text!=''){
                              whatWasWrote='bok';
                              ob=4*bok;
                              ob/=selectedJednostka4.mnoznik;
                              String x=ob.toStringAsFixed(11);
                              controllerObwod.text=przytnijStr(x);
                            }
                          });
                        },
                      )
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.all(7),
                      child: Card(
                        child: Column(
                          children: [
                            InkWell(
                              splashColor: Colors.black12,splashFactory: InkRipple.splashFactory,
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: Text('Bok',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                focus1.unfocus();
                                focus2.unfocus();
                                focus3.unfocus();
                                focus4.unfocus();
                                focus5.unfocus();
                                focus6.unfocus();
                                focus7.unfocus();
                                focus8.unfocus();
                                setState(() {
                                  if(whatWasWrote=='poleWysokosc'){
                                    pierwszaLinia="P=a*h";
                                    drugaLinia="a=P/h";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia="Ob=4a";
                                    drugaLinia="a=Ob/4";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleKatA'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>*sin&#945;";
                                    drugaLinia="a=&#8730;(P/sin&#945;)";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleKatB'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>*sin&#945;";
                                    drugaLinia="a=&#8730;(P/sin&#945;)";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaBkatA'){
                                    pierwszaLinia="cos&#945;=&frac12;d<sub><small><small>2</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>2</small></small></sub>/cos&#945;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaBkatB'){
                                    pierwszaLinia="cos&#945;=&frac12;d<sub><small><small>2</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>2</small></small></sub>/cos&#945;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAkatA'){
                                    pierwszaLinia="cos&#946;=&frac12;d<sub><small><small>1</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>1</small></small></sub>/cos&#946;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAkatB'){
                                    pierwszaLinia="cos&#946;=&frac12;d<sub><small><small>1</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>1</small></small></sub>/cos&#946;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAprzekatnaB'){
                                    pierwszaLinia="a<sup><small><small>2</small></small></sup>=(&frac12;d<sub><small><small>1</small></small></sub><sup><small><small>2</small></small></sup>)+"+
                                        "(&frac12;d<sub><small><small>2</small></small></sub><sup><small><small>2</small></small></sup>)";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else{
                                    pierwszaLinia='';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                    wynik='';
                                  }
                                });
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 10,
                            ),
                            InkWell(
                              splashColor: Colors.black12,splashFactory: InkRipple.splashFactory,
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: Text('Przekątne',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                focus1.unfocus();
                                focus2.unfocus();
                                focus3.unfocus();
                                focus4.unfocus();
                                focus5.unfocus();
                                focus6.unfocus();
                                focus7.unfocus();
                                focus8.unfocus();
                                setState(() {
                                  if(whatWasWrote=='bokKatA'){
                                    pierwszaLinia="cos&#945;=&frac12;d<sub><small><small>2</small></small></sub>/a";
                                    drugaLinia="d<sub><small><small>2</small></small></sub>=2a*cos&#945;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokKatB'){
                                    pierwszaLinia="cos&#945;=&frac12;d<sub><small><small>2</small></small></sub>/a";
                                    drugaLinia="d<sub><small><small>2</small></small></sub>=2a*cos&#945;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaApole'){
                                    pierwszaLinia="P=d<sub><small><small>1</small></small></sub>*d<sub><small><small>2</small></small></sub>/2";
                                    drugaLinia="d<sub><small><small>2</small></small></sub>=2P/d<sub><small><small>1</small></small></sub>";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAkatB'){
                                    pierwszaLinia="tan&#945;=&frac12;d<sub><small><small>2</small></small></sub>/d<sub><small><small>1</small></small></sub>";
                                    drugaLinia="&frac12;d<sub><small><small>2</small></small></sub>=tan&#945;*d<sub><small><small>1</small></small></sub>";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAkatA'){
                                    pierwszaLinia="tan&#945;=&frac12;d<sub><small><small>2</small></small></sub>/d<sub><small><small>1</small></small></sub>";
                                    drugaLinia="&frac12;d<sub><small><small>2</small></small></sub>=tan&#945;*d<sub><small><small>1</small></small></sub>";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAbok'){
                                    pierwszaLinia="(&frac12;d<sub><small><small>2</small></small></sub>)<sup><small><small>2</small></small></sup>=a<sup><small>"
                                        "<small>2</small></small></sup>-(&frac12;d<sub><small><small>1</small></small></sub>)<sup><small><small>2</small></small>"
                                            "</sup>";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else{
                                    pierwszaLinia='';
                                    drugaLinia="";
                                    trzeciaLinia='';
                                    czwartaLinia="";
                                    wynik="";
                                  }
                                });
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 10,
                            ),
                            InkWell(
                              splashColor: Colors.black12,splashFactory: InkRipple.splashFactory,
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: Text('Obwód',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                focus1.unfocus();
                                focus2.unfocus();
                                focus3.unfocus();
                                focus4.unfocus();
                                focus5.unfocus();
                                focus6.unfocus();
                                focus7.unfocus();
                                focus8.unfocus();
                                setState(() {
                                  if(whatWasWrote=='bok'){
                                    pierwszaLinia='Ob=4a';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleWysokosc'){
                                    pierwszaLinia="P=a*h";
                                    drugaLinia="a=P/h";
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAprzekatnaB'){
                                    pierwszaLinia="a<sup><small><small>2</small></small></sup>=(&frac12;d<sub><small><small>1</small></small></sub><sup><small><small>2"
                                        "</small></small></sup>)+(&frac12;a<sup><small><small>2</small></small></sup>=d<sub><small><small>2</small></small></sub><sup>"
                                        "<small><small>2</small></small></sup>)";

                                    drugaLinia="Ob=4a";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleKatA'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>*sin&#945;";
                                    drugaLinia="a=&#8730;(P/sin&#945;)";
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleKatB'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>*sin&#945;";
                                    drugaLinia="a=&#8730;(P/sin&#945;)";
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaBkatA'){
                                    pierwszaLinia="cos&#945;=&frac12;d<sub><small><small>2</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>2</small></small></sub>/cos&#945;";
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaBkatB'){
                                    pierwszaLinia="cos&#945;=&frac12;d<sub><small><small>2</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>2</small></small></sub>/cos&#945;";
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAkatA'){
                                    pierwszaLinia="cos&#946;=&frac12;d<sub><small><small>1</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>1</small></small></sub>/cos&#946;";
                                    trzeciaLinia="Ob=4a";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAkatB'){
                                    pierwszaLinia="cos&#946;=&frac12;d<sub><small><small>1</small></small></sub>/a";
                                    drugaLinia="a=&frac12;d<sub><small><small>1</small></small></sub>/cos&#946;";
                                    trzeciaLinia="Ob=4a";
                                    czwartaLinia='';
                                  }
                                  else{
                                    pierwszaLinia="";
                                    drugaLinia="";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                    wynik="";
                                  }
                                });
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 10,
                            ),
                            InkWell(
                              splashColor: Colors.black12,splashFactory: InkRipple.splashFactory,
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: Text('Pole',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                focus1.unfocus();
                                focus2.unfocus();
                                focus3.unfocus();
                                focus4.unfocus();
                                focus5.unfocus();
                                focus6.unfocus();
                                focus7.unfocus();
                                focus8.unfocus();
                                setState(() {
                                  if(whatWasWrote=='bokWysokosc'){
                                    pierwszaLinia="P=a*h";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAprzekatnaB'){
                                    pierwszaLinia="P=d<sub><small><small>1</small></small></sub>*d<sub><small><small>2</small></small></sub>/2";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokKatA'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>*sin&#945;";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokKatB'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>*sin&#945;";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else{
                                    pierwszaLinia='';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                });
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 10,
                            ),
                            InkWell(
                              splashColor: Colors.black12,splashFactory: InkRipple.splashFactory,
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: Text('Kąty',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                focus1.unfocus();
                                focus2.unfocus();
                                focus3.unfocus();
                                focus4.unfocus();
                                focus5.unfocus();
                                focus6.unfocus();
                                focus7.unfocus();
                                focus8.unfocus();
                                setState(() {
                                  if(whatWasWrote=='przekatnaAprzekatnaB'){
                                    pierwszaLinia="tan&#945;=&frac12;d<sub><small><small>1</small></small></sub>/&frac12;d<sub><small><small>2</small></small></sub>";
                                    drugaLinia="&frac12;&#945;=tan&#945;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaAbok'){
                                    pierwszaLinia="sin&#945;=&frac12;*d<sub><small><small>1</small></small></sub>/a";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatnaBbok'){
                                    pierwszaLinia="cos&#945;=&frac12;*d<sub><small><small>2</small></small></sub>/a";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else{
                                    pierwszaLinia='';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(7),
                    child:Card(
                      child: Column(
                        children: [
                          pierwszaLinia.toString()!=''?Html(data: pierwszaLinia.toString(),style:{'*': Style(
                            fontSize: FontSize(25),
                            textAlign: TextAlign.center,
                          )}
                          ):SizedBox(),
                          drugaLinia.toString()!=''?Html(data: drugaLinia.toString(),style:{'*': Style(
                            fontSize: FontSize(25),
                            textAlign: TextAlign.center,
                          )}):SizedBox(),
                          trzeciaLinia.toString()!=''?Html(data: trzeciaLinia.toString(),style:{'*': Style(
                            fontSize: FontSize(25),
                            textAlign: TextAlign.center,
                          )}):SizedBox(),
                          czwartaLinia.toString()!=''?Html(data: czwartaLinia.toString(),style:{'*': Style(
                            fontSize: FontSize(25),
                            textAlign: TextAlign.center,
                          )}):SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              )
          ),
        ),
      ),
    );
  }
  List<Jednostka> jednostkas = Jednostka.getJednostkas();
  List<Jednostka> jednostkas2 = Jednostka.getJednostkas2();
  List<DropdownMenuItem<Jednostka>> _dropdownMenuItems;
  List<DropdownMenuItem<Jednostka>> _dropdownMenuItems2;
  Jednostka selectedJednostka1,selectedJednostka2,selectedJednostka3,selectedJednostka4,selectedJednostka5,selectedJednostka6,selectedJednostka7;
  List<DropdownMenuItem<Jednostka>> buildDropdownMenuItems(List<Jednostka> jednostkas) {
    List<DropdownMenuItem<Jednostka>> items = List();
    for (Jednostka it in jednostkas) {
      items.add(
        DropdownMenuItem(
          value: it,
          child: Text(it.name),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<Jednostka>> buildDropdownMenuItems2(List<Jednostka> jednostkas) {
    List<DropdownMenuItem<Jednostka>> items = List();
    for (Jednostka it in jednostkas) {
      items.add(
        DropdownMenuItem(
          value: it,
          child: Html(data:it.name.toString()),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem1(Jednostka selectedJednostkaPom) {
    setState(() {
      bok/=selectedJednostka1.mnoznik;
      selectedJednostka1 = selectedJednostkaPom;
      bok*=selectedJednostka1.mnoznik;
    });
  }
  onChangeDropdownItem2(Jednostka selectedJednostkaPom) {
    setState(() {
      przekatnaA/=selectedJednostka2.mnoznik;
      selectedJednostka2 = selectedJednostkaPom;
      przekatnaA*=selectedJednostka2.mnoznik;
    });
  }
  onChangeDropdownItem3(Jednostka selectedJednostkaPom) {
    setState(() {
      przekatnaB/=selectedJednostka3.mnoznik;
      selectedJednostka3 = selectedJednostkaPom;
      przekatnaB*=selectedJednostka3.mnoznik;
    });
  }
  onChangeDropdownItem4(Jednostka selectedJednostkaPom) {
    setState(() {
      obwod/=selectedJednostka4.mnoznik;
      selectedJednostka4 = selectedJednostkaPom;
      obwod*=selectedJednostka4.mnoznik;
    });
  }
  onChangeDropdownItem5(Jednostka selectedJednostkaPom) {
    setState(() {
      pole/=selectedJednostka5.mnoznik;
      selectedJednostka5 = selectedJednostkaPom;
      pole*=selectedJednostka5.mnoznik;
    });
  }
  onChangeDropdownItem6(Jednostka selectedJednostkaPom) {
    setState(() {
      wysokosc/=selectedJednostka6.mnoznik;
      selectedJednostka6 = selectedJednostkaPom;
      wysokosc*=selectedJednostka6.mnoznik;
    });
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
  void setDefaultJednostkas(){
    selectedJednostka1 = _dropdownMenuItems[1].value;
    selectedJednostka2 = _dropdownMenuItems[1].value;
    selectedJednostka3 = _dropdownMenuItems[1].value;
    selectedJednostka4 = _dropdownMenuItems[1].value;
    selectedJednostka5 = _dropdownMenuItems2[1].value;
    selectedJednostka6 = _dropdownMenuItems[1].value;
    selectedJednostka7 = _dropdownMenuItems[1].value;
  }
}
class Jednostka {
  int id;
  String name;
  double mnoznik;
  Jednostka(this.id, this.name,this.mnoznik);
  static List<Jednostka> getJednostkas() {
    return <Jednostka>[
      Jednostka(0, 'mm',0.01),
      Jednostka(1, 'cm',0.1),
      Jednostka(2, 'dm',1),
      Jednostka(3, 'm', 10),
      Jednostka(3, 'km', 10000),
    ];
  }
  static List<Jednostka> getJednostkas2() {
    return <Jednostka>[
      Jednostka(0, "mm<sup><small><small>2</small></small></sup>",0.0001),
      Jednostka(1, 'cm<sup><small><small>2</small></small></sup>',0.01),
      Jednostka(2, 'dm<sup><small><small>2</small></small></sup>',1),
      Jednostka(3, 'm<sup><small><small>2</small></small></sup>', 100),
      Jednostka(3, 'a', 10000),
    ];
  }
}
