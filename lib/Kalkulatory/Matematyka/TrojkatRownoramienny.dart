import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter/services.dart';
import 'dart:math';
class TrojkatRownoramienny extends StatefulWidget {
  final Function comeBack;
  TrojkatRownoramienny({this.comeBack});
  @override
  _TrojkatRownoramiennyState createState() => _TrojkatRownoramiennyState();
}
class _TrojkatRownoramiennyState extends State<TrojkatRownoramienny> {
  double podstawa=-1,ramie=-1, wysokoscA=-1,wysokoscB=-1, pole=-1, obwod=-1,prWpis=-1, prOpis=-1,katAB=-1, katC=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerBok = TextEditingController(),controllerWysokoscA = TextEditingController();
  TextEditingController controllerRamie = TextEditingController(),controllerWysokoscB = TextEditingController();
  TextEditingController controllerPrWpis = TextEditingController(),controllerPrOpis = TextEditingController();
  TextEditingController controllerKatAB = TextEditingController(),controllerKatC = TextEditingController();
  FocusNode focus1,focus2,focus3,focus4,focus5,focus6,focus7,focus8,focus9,focus10;
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
    focus9=new FocusNode();
    focus10=new FocusNode();
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
    focus9.dispose();
    focus10.dispose();
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
                              controllerBok = new TextEditingController();
                              controllerRamie = new TextEditingController();
                              controllerObwod = new TextEditingController();
                              controllerPole = new TextEditingController();
                              controllerWysokoscA = new TextEditingController();
                              controllerWysokoscB = new TextEditingController();
                              controllerPrWpis = new TextEditingController();
                              controllerPrOpis = new TextEditingController();
                              controllerKatAB = new TextEditingController();
                              controllerKatC = new TextEditingController();
                              podstawa=-1;
                              ramie=-1;
                              obwod=-1;
                              pole=-1;
                              wysokoscA=-1;
                              wysokoscB=-1;
                              prOpis=-1;
                              prWpis=-1;
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
                                  //width:260,
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
                                        podstawa = double.parse(val);
                                        podstawa*=selectedJednostka1.mnoznik;
                                        if(val==''){
                                          podstawa=-1;
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
                                    unFocusAll();
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
                                      controller: controllerRamie,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Ramię',
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
                                        ramie = double.parse(val);
                                        ramie*=selectedJednostka2.mnoznik;
                                        if(val==''){
                                          ramie=-1;
                                        }
                                      }),
                                      validator: (val)=>val.isEmpty? 'Podaj czas opróżniania' :null,
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
                                    unFocusAll();
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
                                        obwod*=selectedJednostka3.mnoznik;
                                        if(val==''){
                                          obwod=-1;
                                        }
                                      }),
                                      validator: (val)=>val.isEmpty? 'Podaj czas opróżniania' :null,
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
                                    unFocusAll();
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
                                        pole*=selectedJednostka4.mnoznik;
                                        if(val.toString()==''){
                                          pole=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              //Text('cm',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600)),
                              Container(
                                width: 80,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka4,
                                  items: _dropdownMenuItems2,
                                  onChanged: onChangeDropdownItem4,
                                  onTap: (){
                                    unFocusAll();
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
                                      controller: controllerWysokoscA,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Wysokość na podst.',
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
                                        wysokoscA = double.parse(val);
                                        wysokoscA*=selectedJednostka5.mnoznik;
                                        if(val==''){
                                          wysokoscA=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka5,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem5,
                                  onTap: (){
                                    unFocusAll();
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
                                      controller: controllerWysokoscB,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Wysokość na ramię',
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
                                        wysokoscB = double.parse(val);
                                        wysokoscB*=selectedJednostka6.mnoznik;
                                        if(val==''){
                                          wysokoscB=-1;
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
                                    unFocusAll();
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
                                      controller: controllerPrWpis,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Pr. okr. wpis.',
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
                                        prWpis = double.parse(val);
                                        prWpis*=selectedJednostka7.mnoznik;
                                        if(val==''){
                                          prWpis=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka7,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem7,
                                  onTap: (){
                                    unFocusAll();
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
                                      focusNode: focus8,
                                      controller: controllerPrOpis,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Pr. okr. opis.',
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
                                        prOpis = double.parse(val);
                                        prOpis*=selectedJednostka8.mnoznik;
                                        if(val==''){
                                          prOpis=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 60,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka8,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem8,
                                  onTap: (){
                                    unFocusAll();
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
                                      focusNode: focus9,
                                      controller: controllerKatAB,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Kąt wierzch. A i B',
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
                                        katAB = double.parse(val);
                                        if(val==''){
                                          katAB=-1;
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
                                      focusNode: focus10,
                                      controller: controllerKatC,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Kąt wierzch. C',
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
                                        katC = double.parse(val);
                                        if(val==''){
                                          katC=-1;
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
                            unFocusAll();
                            setState(() {
                              double a,r1,r2,ob,p,h1,h2,kat1,kat2,b,sinus,cosinus,tanges;
                              if(controllerBok.text!=''&&controllerRamie.text!=''&&controllerPrWpis.text!=''){
                                whatWasWrote='bokRamieWpis';
                                ob=2*ramie+podstawa;
                                p=ob*prWpis/2;

                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                              }
                              else if(controllerBok.text!=''&&controllerRamie.text!=''&&controllerPrOpis.text!=''){
                                whatWasWrote='bokRamieOpis';
                                ob=2*ramie+podstawa;
                                p=podstawa*ramie*ramie/4/prOpis;

                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                              }
                              else if(controllerPole.text!=''&&controllerBok.text!=''&&controllerPrWpis.text!=''){
                                whatWasWrote='poleBokWpis';
                                ob=2*pole/prWpis;
                                b=(ob-podstawa)/2;
                                a=podstawa/2;
                                h1=p/podstawa;
                                h2=p/b;
                                cosinus=a/b;
                                kat1=acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=(90-kat1)*2;
                                b/=selectedJednostka2.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                h2/=selectedJednostka6.mnoznik;
                                ob/=selectedJednostka3.mnoznik;
                                String x=b.toStringAsFixed(11);
                                String x2 = h1.toStringAsFixed(11);
                                String x3 = h2.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                String x6=ob.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
                                controllerWysokoscA.text=przytnijStr(x2);
                                controllerWysokoscB.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                                controllerObwod.text=przytnijStr(x6);
                              }
                              else if(controllerPole.text!=''&&controllerRamie.text!=''&&controllerPrWpis.text!=''){
                                whatWasWrote='poleRamieWpis';
                                ob=2*pole/prWpis;
                                a=ob-(2*ramie);
                                h1=p/a;
                                h2=p/ramie;
                                cosinus=a/ramie;
                                kat1=acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=(90-kat1)*2;
                                a/=selectedJednostka1.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                h2/=selectedJednostka6.mnoznik;
                                ob/=selectedJednostka3.mnoznik;
                                String x=a.toStringAsFixed(11);
                                String x2 = h1.toStringAsFixed(11);
                                String x3 = h2.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                String x6=ob.toStringAsFixed(11);
                                controllerBok.text=przytnijStr(x);
                                controllerWysokoscA.text=przytnijStr(x2);
                                controllerWysokoscB.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                                controllerObwod.text=przytnijStr(x6);
                              }
                              else if(controllerPole.text!=''&&controllerRamie.text!=''&&controllerPrOpis.text!=''){
                                whatWasWrote='poleRamieOpis';
                                a=pole*4*prOpis/ramie/ramie;
                                ob=4*a;
                                h1=p/a;
                                h2=p/ramie;
                                cosinus=a/ramie;
                                kat1=acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=(90-kat1)*2;
                                a/=selectedJednostka1.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                h2/=selectedJednostka6.mnoznik;
                                ob/=selectedJednostka3.mnoznik;
                                String x=a.toStringAsFixed(11);
                                String x2 = h1.toStringAsFixed(11);
                                String x3 = h2.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                String x6=ob.toStringAsFixed(11);
                                controllerBok.text=przytnijStr(x);
                                controllerWysokoscA.text=przytnijStr(x2);
                                controllerWysokoscB.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                                controllerObwod.text=przytnijStr(x6);
                              }
                              else if(controllerPole.text!=''&&controllerRamie.text!=''&&controllerBok.text!=''){
                                whatWasWrote='poleRamieBok';
                                ob=ramie+(2*podstawa);
                                r1=2*pole/ob;
                                r2=podstawa*ramie*ramie/4/p;
                                h1=pole*2/podstawa;
                                h2=pole*2/ramie;
                                cosinus=podstawa/ramie;
                                kat1=acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=(90-kat1)*2;
                                ob/=selectedJednostka3.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                h2/=selectedJednostka6.mnoznik;
                                r1/=selectedJednostka7.mnoznik;
                                r2/=selectedJednostka8.mnoznik;
                                String x = ob.toStringAsFixed(11);
                                String x2 = h1.toStringAsFixed(11);
                                String x3 = h2.toStringAsFixed(11);
                                String x4 = r1.toStringAsFixed(11);
                                String x5 = r2.toStringAsFixed(11);
                                String x6 = kat1.toStringAsFixed(11);
                                String x7 = kat2.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                                controllerWysokoscA.text=przytnijStr(x2);
                                controllerWysokoscB.text=przytnijStr(x3);
                                controllerPrWpis.text=przytnijStr(x4);
                                controllerPrOpis.text=przytnijStr(x5);
                                controllerKatAB.text=przytnijStr(x6);
                                controllerKatC.text=przytnijStr(x7);
                              }
                              else if(controllerKatAB.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='katRamie';
                                kat1=katAB%90;
                                kat2=90-kat1;
                                kat2*=2;
                                kat1=kat1*pi/180;
                                cosinus= cos(kat1);
                                a=cosinus*ramie;
                                a*=2;
                                sinus=sin(kat1);
                                h1=sinus*ramie;
                                p=a*h1/2;
                                ob=a+(2*ramie);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=a.toStringAsFixed(11);
                                String x4=h1.toStringAsFixed(11);
                                String x5=kat2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerBok.text=przytnijStr(x3);
                                controllerWysokoscA.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if(controllerKatC.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='katRamie';
                                kat2=katC%180;
                                kat2=kat2/2;
                                kat1=90-kat2;
                                double kat1a=kat1*pi/180;
                                cosinus= cos(kat1a);
                                a=cosinus*ramie;
                                a*=2;
                                sinus=sin(kat1a);
                                h1=sinus*ramie;
                                p=a*h1/2;
                                ob=a+(2*ramie);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=a.toStringAsFixed(11);
                                String x4=h1.toStringAsFixed(11);
                                String x5=kat1.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerBok.text=przytnijStr(x3);
                                controllerWysokoscA.text=przytnijStr(x4);
                                controllerKatAB.text=przytnijStr(x5);
                              }
                              else if(controllerKatAB.text!=''&&controllerBok.text!=''){
                                whatWasWrote='katBok';
                                kat1=katAB%90;
                                kat2=90-kat1;
                                kat2*=2;
                                kat1=kat1*pi/180;
                                cosinus= cos(kat1);
                                a=podstawa/2;
                                b=a/cosinus;
                                sinus=sin(kat1);
                                h1=sinus*b;
                                p=podstawa*h1/2;
                                ob=podstawa+(2*b);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                b/=selectedJednostka2.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=b.toStringAsFixed(11);
                                String x4=h1.toStringAsFixed(11);
                                String x5=kat2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerRamie.text=przytnijStr(x3);
                                controllerWysokoscA.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if(controllerKatC.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='katRamie';
                                kat2=katC%180;
                                kat2=kat2/2;
                                kat1=90-kat2;
                                double kat1a=kat1*pi/180;
                                cosinus= cos(kat1a);
                                a=podstawa/2;
                                b=a/cosinus;
                                sinus=sin(kat1a);
                                h1=sinus*b;
                                p=podstawa*h1/2;
                                ob=podstawa+(2*b);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                b/=selectedJednostka2.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=b.toStringAsFixed(11);
                                String x4=h1.toStringAsFixed(11);
                                String x5=kat1.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerRamie.text=przytnijStr(x3);
                                controllerWysokoscA.text=przytnijStr(x4);
                                controllerKatAB.text=przytnijStr(x5);
                              }
                              else if(controllerKatAB.text!=''&&controllerWysokoscA.text!=''){
                                whatWasWrote='katWysokosc';
                                kat1=katAB%90;
                                kat2=90-kat1;
                                kat2*=2;
                                kat1=kat1*pi/180;
                                sinus=sin(kat1);
                                b=wysokoscA/sinus;
                                cosinus= cos(kat1);
                                a=cosinus*b;
                                a*=2;
                                p=a*h1/2;
                                ob=a+(2*b);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                b/=selectedJednostka2.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=a.toStringAsFixed(11);
                                String x4=b.toStringAsFixed(11);
                                String x5=kat2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerBok.text=przytnijStr(x3);
                                controllerRamie.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if(controllerKatC.text!=''&&controllerWysokoscA.text!=''){
                                whatWasWrote='katWysokosc';
                                kat2=katC%180;
                                kat2=kat2/2;
                                kat1=90-kat2;
                                double kat1a=kat1*pi/180;
                                sinus=sin(kat1a);
                                b=wysokoscA/sinus;
                                cosinus= cos(kat1a);
                                a=cosinus*b;
                                a*=2;
                                p=a*h1/2;
                                ob=a+(2*b);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                b/=selectedJednostka2.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=a.toStringAsFixed(11);
                                String x4=b.toStringAsFixed(11);
                                String x5=kat1.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerBok.text=przytnijStr(x3);
                                controllerRamie.text=przytnijStr(x4);
                                controllerKatAB.text=przytnijStr(x5);
                              }
                              else if(controllerKatAB.text!=''&&controllerPrWpis.text!=''){
                                whatWasWrote='katWpis';
                                kat1=katAB%90;
                                kat2=90-kat1;
                                double kat2a=kat2;
                                kat2*=2;
                                kat1=kat1*pi/180;
                                kat2a=kat2a*pi/180;
                                sinus=sin(kat2a);
                                h1 = prWpis+(prWpis/sinus);
                                sinus=sin(kat1);
                                b=h1/sinus;
                                cosinus= cos(kat1);
                                a=cosinus*b;
                                a*=2;
                                p=a*h1/2;
                                ob=a+(2*b);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                b/=selectedJednostka2.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=a.toStringAsFixed(11);
                                String x4=b.toStringAsFixed(11);
                                String x5=h1.toStringAsFixed(11);
                                String x6=kat2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerBok.text=przytnijStr(x3);
                                controllerRamie.text=przytnijStr(x4);
                                controllerWysokoscA.text=przytnijStr(x5);
                                controllerKatC.text=przytnijStr(x6);
                              }
                              else if(controllerKatC.text!=''&&controllerWysokoscA.text!=''){
                                whatWasWrote='katWysokosc';
                                kat2=katC%180;
                                kat2=kat2/2;
                                kat1=90-kat2;
                                double kat1a=kat1*pi/180;
                                double kat2a=kat2*pi/180;
                                sinus=sin(kat2a);
                                h1 = prWpis+(prWpis/sinus);
                                sinus=sin(kat1a);
                                b=h1/sinus;
                                cosinus= cos(kat1a);
                                a=cosinus*b;
                                a*=2;
                                p=a*h1/2;
                                ob=a+(2*b);
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                b/=selectedJednostka2.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2=ob.toStringAsFixed(11);
                                String x3=a.toStringAsFixed(11);
                                String x4=b.toStringAsFixed(11);
                                String x5=h1.toStringAsFixed(11);
                                String x6=kat1.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerBok.text=przytnijStr(x3);
                                controllerRamie.text=przytnijStr(x4);
                                controllerWysokoscA.text=przytnijStr(x5);
                                controllerKatAB.text=przytnijStr(x6);
                              }
                              else if(controllerRamie.text!=''&&controllerBok.text!=''){
                                whatWasWrote='ramieBok';
                                a=podstawa/2;
                                h1=(ramie*ramie)-(a*a);
                                h1=sqrt(h1);
                                ob=podstawa+(2*ramie);
                                p=h1*a;
                                h2=p/ramie;
                                cosinus=a/ramie;
                                kat1=acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=(90-kat1)*2;
                                r1=2*p/ob;
                                r2=podstawa*ramie*ramie/4/p;
                                p/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka3.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                h2/=selectedJednostka6.mnoznik;
                                r1/=selectedJednostka7.mnoznik;
                                r2/=selectedJednostka8.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = h1.toStringAsFixed(11);
                                String x4 = h2.toStringAsFixed(11);
                                String x5 = r1.toStringAsFixed(11);
                                String x6 = r2.toStringAsFixed(11);
                                String x7 = kat1.toStringAsFixed(11);
                                String x8 = kat2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerWysokoscA.text=przytnijStr(x3);
                                controllerWysokoscB.text=przytnijStr(x4);
                                controllerPrWpis.text=przytnijStr(x5);
                                controllerPrOpis.text=przytnijStr(x6);
                                controllerKatAB.text=przytnijStr(x7);
                                controllerKatC.text=przytnijStr(x8);
                              }
                              else if(controllerObwod.text!=''&&controllerBok.text!=''){
                                whatWasWrote='obwodBok';
                                b=(obwod-podstawa)/2;
                                a=podstawa/2;
                                h1=(b*b)-(a*a);
                                h1=sqrt(h1);
                                ob=podstawa+(2*b);
                                p=h1*a;
                                h2=p/b;
                                cosinus=a/b;
                                kat1=acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=(90-kat1)*2;
                                r1=2*p/ob;
                                r2=podstawa*b*b/4/p;
                                p/=selectedJednostka4.mnoznik;
                                b/=selectedJednostka2.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                h2/=selectedJednostka6.mnoznik;
                                r1/=selectedJednostka7.mnoznik;
                                r2/=selectedJednostka8.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2 = b.toStringAsFixed(11);
                                String x3 = h1.toStringAsFixed(11);
                                String x4 = h2.toStringAsFixed(11);
                                String x5 = r1.toStringAsFixed(11);
                                String x6 = r2.toStringAsFixed(11);
                                String x7 = kat1.toStringAsFixed(11);
                                String x8 = kat2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerRamie.text=przytnijStr(x2);
                                controllerWysokoscA.text=przytnijStr(x3);
                                controllerWysokoscB.text=przytnijStr(x4);
                                controllerPrWpis.text=przytnijStr(x5);
                                controllerPrOpis.text=przytnijStr(x6);
                                controllerKatAB.text=przytnijStr(x7);
                                controllerKatC.text=przytnijStr(x8);
                              }
                              else if(controllerRamie.text!=''&&controllerObwod.text!=''){
                                whatWasWrote='obwodRamie';
                                a=(obwod-(2*ramie))/2;
                                h1=(ramie*ramie)-(a*a);
                                h1=sqrt(h1);
                                ob=a+(2*ramie);
                                p=h1*a;
                                h2=p/ramie;
                                cosinus=a/ramie;
                                kat1=acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=(90-kat1)*2;
                                a*=2;
                                r1=2*p/ob;
                                r2=a*ramie*ramie/4/p;
                                p/=selectedJednostka4.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                h1/=selectedJednostka5.mnoznik;
                                h2/=selectedJednostka6.mnoznik;
                                r1/=selectedJednostka7.mnoznik;
                                r2/=selectedJednostka8.mnoznik;
                                String x=p.toStringAsFixed(11);
                                String x2 = a.toStringAsFixed(11);
                                String x3 = h1.toStringAsFixed(11);
                                String x4 = h2.toStringAsFixed(11);
                                String x5 = r1.toStringAsFixed(11);
                                String x6 = r2.toStringAsFixed(11);
                                String x7 = kat1.toStringAsFixed(11);
                                String x8 = kat2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerBok.text=przytnijStr(x2);
                                controllerWysokoscA.text=przytnijStr(x3);
                                controllerWysokoscB.text=przytnijStr(x4);
                                controllerPrWpis.text=przytnijStr(x5);
                                controllerPrOpis.text=przytnijStr(x6);
                                controllerKatAB.text=przytnijStr(x7);
                                controllerKatC.text=przytnijStr(x8);
                              }
                              else if(controllerWysokoscA.text!=''&&controllerBok.text!=''){
                                whatWasWrote='wysokoscBok';
                                p=podstawa*wysokoscA/2;

                                p/=selectedJednostka4.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerWysokoscB.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='wysokoscRamie';
                                p=ramie*wysokoscB/2;

                                p/=selectedJednostka4.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerObwod.text!=''&&controllerPrWpis.text!=''){
                                whatWasWrote='obwodWpis';
                                p=obwod*prWpis/2;

                                p/=selectedJednostka4.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerPole.text!=''&&controllerPrWpis.text!=''){
                                whatWasWrote='poleWpis';
                                ob=2*pole/prWpis;
                                ob/=selectedJednostka3.mnoznik;
                                String x = ob.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                              }
                              else if(controllerPole.text!=''&&controllerBok.text!=''){
                                h1 = 2*pole/podstawa;
                                h1/=selectedJednostka5.mnoznik;
                                String x = h1.toStringAsFixed(11);
                                controllerWysokoscA.text = przytnijStr(x);
                              }
                              else if(controllerPole.text!=''&&controllerRamie.text!=''){
                                h2 = 2*pole/ramie;
                                h2/=selectedJednostka6.mnoznik;
                                String x = h2.toStringAsFixed(11);
                                controllerWysokoscB.text = przytnijStr(x);
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
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='wysokoscRamie'){
                                    pierwszaLinia="b<sup><small><small>2</small></small></sup>=h<sup><small><small>2</small></small></sup>+(&frac12;a)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="&frac14;*a<sup><small><small>2</small></small></sup>=b<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katWpis'){
                                    pierwszaLinia="h=r+(2*r/&#8730;3)";
                                    drugaLinia="b=2*h";
                                    trzeciaLinia="a=b&#8730;3";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwodRamie'){
                                    pierwszaLinia="a=Ob-2*b";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleRamieOpis'){
                                    pierwszaLinia="P=a*b<sup><small><small>2</small></small></sup>/(4*R)";
                                    drugaLinia="a=P*4*R/b<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katWysokosc'){
                                    pierwszaLinia="tg&#946;=h/&frac12;a";
                                    drugaLinia='a=2*h/tg&#946;';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katRamie'){
                                    pierwszaLinia="cos&#946;=&frac12;a/b";
                                    drugaLinia='a=2*cos&#946;*b';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleRamieWpis'){
                                    pierwszaLinia="P=Ob/r";
                                    drugaLinia="P=(a+b+b)/r";
                                    trzeciaLinia="a=P*r-2*b";
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
                                  child: Text('Wysokość',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='poleRamieOpis'){
                                    pierwszaLinia="P=a*b<sup><small><small>2</small></small></sup>/4R";
                                    drugaLinia="a=4*R*P/b<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="h<sup><small><small>2</small></small></sup>=b<sup><small><small>2</small></small></sup>-(&frac12;a)<sup><small><small>2</small></small></sup>";
                                    czwartaLinia="h=&#8730;(b<sup><small><small>2</small></small></sup>-&frac14;a<sup><small><small>2</small></small></sup>)";
                                  }
                                  else if(whatWasWrote=='ramieBok'){
                                    pierwszaLinia="b<sup><small><small>2</small></small></sup>=(&frac12;a)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    drugaLinia="h=&#8730;(b<sup><small><small>2</small></small></sup>-&frac14;a<sup><small><small>2</small></small></sup>)";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleBok'){
                                    pierwszaLinia="P=&frac12;*a*h";
                                    drugaLinia="h=2*P/a";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleRamie'){
                                    pierwszaLinia="P=&frac12;*b*h<sub><small><small>b</small></small></sub>";
                                    drugaLinia="h<sub><small><small>b</small></small></sub>=2*P/b";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katBok'){
                                    pierwszaLinia='tg&#946;=h/&frac12;a';
                                    drugaLinia='h=&frac12;tg&#946;*a';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katRamie'){
                                    pierwszaLinia= 'sin&#946;=h/b';
                                    drugaLinia='h=sin&#946;*b';
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
                                  child: Text('Obwód',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='wysokoscRamie'){
                                    pierwszaLinia="b<sup><small><small>2</small></small></sup>=h<sup><small><small>2</small></small></sup>+(&frac12;a)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="&frac14;*a<sup><small><small>2</small></small></sup>=b<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia='Ob=a+2b';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katWpis'){
                                    pierwszaLinia="h=r+(2*r/&#8730;3)";
                                    drugaLinia="b=2*h";
                                    trzeciaLinia="a=b&#8730;3";
                                    czwartaLinia='Ob=a+2b';
                                  }
                                  else if(whatWasWrote=='katRamie'){
                                    pierwszaLinia="cos&#946;=&frac12;a/b";
                                    drugaLinia='a=2*cos&#946;*b';
                                    trzeciaLinia='Ob=a+2b';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleRamieWpis'){
                                    pierwszaLinia="P=Ob/r";
                                    drugaLinia="P=(a+b+b)/r";
                                    trzeciaLinia="a=P*r-2*b";
                                    czwartaLinia='Ob=a+2b';
                                  }
                                  else if(whatWasWrote=='ramieBok'){
                                    pierwszaLinia='Ob=a+2b';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokoscBok'){
                                    pierwszaLinia="b<sup><small><small>2</small></small></sup>=(&frac12;*a)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    drugaLinia="b<sup><small><small>2</small></small></sup>=&frac14;*a<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia='Ob=a+2b';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='poleWpis'){
                                    pierwszaLinia="P=&frac12;*Ob*r";
                                    drugaLinia="Ob=2*P/r";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katBok'){
                                    pierwszaLinia='cos&#946;=&frac12;a/b';
                                    drugaLinia='b=&frac12;a/cos&#946;';
                                    trzeciaLinia='Ob=a+2b';
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
                                  child: Text('Pole',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='wysokoscBok'){
                                    pierwszaLinia="P=&frac12;*a*h";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokoscRamie'){
                                    pierwszaLinia="(&frac14;a<sup><small><small>2</small></small></sup>)=b<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>";
                                    drugaLinia="a=&#8730;(4*(b<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>))";
                                    trzeciaLinia="P=&frac12;*a*h";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwodWpis'){
                                    pierwszaLinia="P=&frac12;*Ob*r";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokRamieWpis'){
                                    pierwszaLinia="Ob=a+b";
                                    drugaLinia="P=&frac12;*Ob*r";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokRamieOpis'){
                                    pierwszaLinia="P=a*b<sup><small><small>2</small></small></sup>/(4*R)";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katRamie'){
                                    pierwszaLinia="cos&#946;=&frac12;a/b";
                                    drugaLinia='a=2*cos&#946;*b';
                                    trzeciaLinia='h<sup><small><small>2</small></small></sup>=b<sup><small><small>2</small></small></sup>-a<sup><small><small>2</small></small></sup>';
                                    czwartaLinia='P=&frac12;a*h';
                                  }
                                  else if(whatWasWrote=='katBok'){
                                    pierwszaLinia="tg&#946;=h/&frac12;a";
                                    drugaLinia='h=tg&#946;*&frac12a';
                                    trzeciaLinia='P=&frac12;a*h';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='katWysokosc'){
                                    pierwszaLinia="tg&#946;=h/&frac12;a";
                                    drugaLinia='&frac12;a=h/tg&#946;';
                                    trzeciaLinia='P=&frac12;a*h';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokRamie'){
                                    pierwszaLinia="h<sup><small><small>2</small></small></sup>=b<sup><small><small>2</small></small></sup>-&frac14*a<sup><small><small>2</small></small></sup>";
                                    drugaLinia="P=&frac12;*a*h";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwodBok'){
                                    pierwszaLinia="b=(Ob-a)/2";
                                    drugaLinia="b<sup><small><small>2</small></small></sup>=(&frac12;a)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="h=&#8730;(b<sup><small><small>2</small></small></sup>-&frac14;a<sup><small><small>2</small></small></sup>)";
                                    czwartaLinia="&frac12;*a*h";
                                  }
                                  else if(whatWasWrote=='obwodRamie'){
                                    pierwszaLinia="a=Ob-2b";
                                    drugaLinia="b<sup><small><small>2</small></small></sup>=(&frac12;a)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="h=&#8730;(b<sup><small><small>2</small></small></sup>-&frac14;a<sup><small><small>2</small></small></sup>)";
                                    czwartaLinia="&frac12;*a*h";
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
                                  child: Text('Promień wpis.',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='poleRamieBok'){
                                    pierwszaLinia="P=&frac12;Ob*r";
                                    drugaLinia="r=2*P/(a+2*b)";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokRamie'){
                                    pierwszaLinia="h<sup><small><small>2</small></small></sup>=b<sup><small><small>2</small></small></sup>-&frac14*a<sup><small><small>2</small></small></sup>";
                                    drugaLinia="P=&frac12;*a*h";
                                    trzeciaLinia="P=&frac12;Ob*r";
                                    czwartaLinia="r=2*P/Ob";
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
                                  child: Text('Promień opis.',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='poleRamieBok'){
                                    pierwszaLinia="P=a*b<sup><small><small>2</small></small></sup>/4R";
                                    drugaLinia="R=a*b<sup><small><small>2</small></small></sup>/4P";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bokRamie'){
                                    pierwszaLinia="h<sup><small><small>2</small></small></sup>=b<sup><small><small>2</small></small></sup>-&frac14*a<sup><small><small>2</small></small></sup>";
                                    drugaLinia="P=&frac12;*a*h";
                                    trzeciaLinia="P=a*b<sup><small><small>2</small></small></sup>/4R";
                                    czwartaLinia="R=a*b<sup><small><small>2</small></small></sup>/4P";
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
  Jednostka selectedJednostka1,selectedJednostka2,selectedJednostka3,selectedJednostka4,selectedJednostka5,selectedJednostka6;
  Jednostka selectedJednostka7,selectedJednostka8,selectedJednostka9;
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
      podstawa/=selectedJednostka1.mnoznik;
      selectedJednostka1 = selectedJednostkaPom;
      podstawa*=selectedJednostka1.mnoznik;
    });
  }
  onChangeDropdownItem2(Jednostka selectedJednostkaPom) {
    setState(() {
      ramie/=selectedJednostka2.mnoznik;
      selectedJednostka2 = selectedJednostkaPom;
      ramie*=selectedJednostka2.mnoznik;
    });
  }
  onChangeDropdownItem3(Jednostka selectedJednostkaPom) {
    setState(() {
      obwod/=selectedJednostka3.mnoznik;
      selectedJednostka3 = selectedJednostkaPom;
      obwod*=selectedJednostka3.mnoznik;
    });
  }
  onChangeDropdownItem4(Jednostka selectedJednostkaPom) {
    setState(() {
      pole/=selectedJednostka4.mnoznik;
      selectedJednostka4 = selectedJednostkaPom;
      pole*=selectedJednostka4.mnoznik;
    });
  }
  onChangeDropdownItem5(Jednostka selectedJednostkaPom) {
    setState(() {
      wysokoscA/=selectedJednostka5.mnoznik;
      selectedJednostka5 = selectedJednostkaPom;
      wysokoscA*=selectedJednostka5.mnoznik;
    });
  }
  onChangeDropdownItem6(Jednostka selectedJednostkaPom) {
    setState(() {
      wysokoscB/=selectedJednostka6.mnoznik;
      selectedJednostka6 = selectedJednostkaPom;
      wysokoscB*=selectedJednostka6.mnoznik;
    });
  }
  onChangeDropdownItem7(Jednostka selectedJednostkaPom) {
    setState(() {
      prWpis/=selectedJednostka7.mnoznik;
      selectedJednostka7 = selectedJednostkaPom;
      prWpis*=selectedJednostka7.mnoznik;
    });
  }
  onChangeDropdownItem8(Jednostka selectedJednostkaPom) {
    setState(() {
      prOpis/=selectedJednostka8.mnoznik;
      selectedJednostka8 = selectedJednostkaPom;
      prOpis*=selectedJednostka8.mnoznik;
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
    selectedJednostka4 = _dropdownMenuItems2[1].value;
    selectedJednostka5 = _dropdownMenuItems[1].value;
    selectedJednostka6 = _dropdownMenuItems[1].value;
    selectedJednostka7 = _dropdownMenuItems[1].value;
    selectedJednostka8 = _dropdownMenuItems[1].value;
  }
  void unFocusAll(){
    focus1.unfocus();
    focus2.unfocus();
    focus3.unfocus();
    focus4.unfocus();
    focus5.unfocus();
    focus6.unfocus();
    focus7.unfocus();
    focus8.unfocus();
    focus9.unfocus();
    focus10.unfocus();
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
