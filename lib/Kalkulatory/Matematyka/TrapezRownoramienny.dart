import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter/services.dart';
import 'dart:math';
class TrapezRownoramienny extends StatefulWidget {
  final Function comeBack;
  TrapezRownoramienny({this.comeBack});
  @override
  _TrapezRownoramiennyState createState() => _TrapezRownoramiennyState();
}
class _TrapezRownoramiennyState extends State<TrapezRownoramienny> {
  double podstawaA=-1,podstawaB=-1,ramie=-1, wysokosc=-1, pole=-1, obwod=-1,przekatna=-1,katAB=-1, katC=-1, katPrzekatne=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerPodstawaA = TextEditingController(),controllerPodstawaB = TextEditingController();
  TextEditingController controllerRamie = TextEditingController(),controllerWysokosc = TextEditingController();
  TextEditingController controllerPrzekatna = TextEditingController(),controllerKatPrzekatne = TextEditingController();
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
                              controllerPodstawaA = new TextEditingController();
                              controllerPodstawaB = new TextEditingController();
                              controllerRamie = new TextEditingController();
                              controllerObwod = new TextEditingController();
                              controllerPole = new TextEditingController();
                              controllerWysokosc = new TextEditingController();
                              controllerKatAB = new TextEditingController();
                              controllerKatC = new TextEditingController();
                              controllerKatPrzekatne = new TextEditingController();
                              controllerPrzekatna=new TextEditingController();
                              podstawaA=-1;
                              podstawaB=-1;
                              ramie=-1;
                              obwod=-1;
                              pole=-1;
                              wysokosc=-1;
                              katAB=-1;
                              katC=-1;
                              katPrzekatne=-1;
                              przekatna=-1;
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
                                      controller: controllerPodstawaA,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Górna podstawa',
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
                                        podstawaA = double.parse(val);
                                        podstawaA*=selectedJednostka1.mnoznik;
                                        if(val==''){
                                          podstawaA=-1;
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
                                      controller: controllerPodstawaB,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Dolna podstawa',
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
                                        podstawaB = double.parse(val);
                                        podstawaB*=selectedJednostka2.mnoznik;
                                        if(val==''){
                                          podstawaB=-1;
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
                                        ramie*=selectedJednostka3.mnoznik;
                                        if(val==''){
                                          ramie=-1;
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
                                        wysokosc*=selectedJednostka4.mnoznik;
                                        if(val.toString()==''){
                                          wysokosc=-1;
                                        }
                                      }),
                                    )),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 80,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka4,
                                  items: _dropdownMenuItems,
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
                                        obwod*=selectedJednostka5.mnoznik;
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
                                        pole*=selectedJednostka6.mnoznik;
                                        if(val==''){
                                          pole=-1;
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
                                  items: _dropdownMenuItems2,
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
                                      controller: controllerPrzekatna,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Przekątna',
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
                                        przekatna = double.parse(val);
                                        przekatna*=selectedJednostka7.mnoznik;
                                        if(val==''){
                                          przekatna=-1;
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
                                      controller: controllerKatAB,
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
                                      focusNode: focus9,
                                      controller: controllerKatC,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Kąt rozwartokątny',
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
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus10,
                                      controller: controllerKatPrzekatne,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Kąt ostry między przekątnymi',
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
                                        katPrzekatne = double.parse(val);
                                        if(val==''){
                                          katPrzekatne=-1;
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
                              double a1,a2,ob,p,h,kat1,kat2,kat3,b,sinus,cosinus,tanges;
                              if(controllerPodstawaA.text!=''&&controllerPodstawaB.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='podstawaApodstawaBramie';
                                double pom = (podstawaB-podstawaA)/2;
                                pom*=pom;
                                b = ramie*ramie;
                                h = b-pom;
                                h = sqrt(h);
                                p = (podstawaA+podstawaB)*h/2;
                                sinus = h/ramie;
                                kat1 = asin(sinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                ob= podstawaA+podstawaB+ramie+ramie;
                                h/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = h.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                controllerWysokosc.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if(controllerPodstawaA.text!=''&&controllerWysokosc.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='podstawaAwysokoscRamie';
                                b = ramie*ramie;
                                h = wysokosc*wysokosc;
                                double pom = (b-h);
                                pom = sqrt(pom);
                                a2=podstawaA+(2*pom);
                                p = (podstawaA+a2)*wysokosc/2;
                                sinus = wysokosc/ramie;
                                kat1 = asin(sinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                ob= podstawaA+a2+ramie+ramie;
                                a2/=selectedJednostka2.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = a2.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                controllerPodstawaB.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if(controllerPodstawaB.text!=''&&controllerWysokosc.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='podstawaBwysokoscRamie';
                                b = ramie*ramie;
                                h = wysokosc*wysokosc;
                                double pom = (b-h);
                                pom = sqrt(pom);
                                a1=podstawaB-(2*pom);
                                p = (a1+podstawaB)*wysokosc/2;
                                sinus = wysokosc/ramie;
                                kat1 = asin(sinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                ob= a1+podstawaB+ramie+ramie;
                                a1/=selectedJednostka1.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = a1.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                controllerPodstawaA.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if(controllerPodstawaB.text!=''&&controllerWysokosc.text!=''&&controllerPodstawaA.text!=''){
                                whatWasWrote='podstawaApodstawaBwysokosc';
                                h = wysokosc*wysokosc;
                                double pom = (podstawaB-podstawaA)/2;
                                pom*=pom;
                                b = h+pom;
                                b = sqrt(b);
                                p = (podstawaA+podstawaB)*wysokosc/2;
                                sinus = wysokosc/b;
                                kat1 = asin(sinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                ob= podstawaA+podstawaB+b+b;
                                b/=selectedJednostka3.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = b.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if(controllerPodstawaA.text!=''&&controllerPodstawaB.text!=''&&(controllerKatAB.text!=''||controllerKatC.text!='')){
                                whatWasWrote='podstawaApodstawaBkat';
                                if(controllerKatAB.text!=''){
                                  kat1 = katAB;
                                  kat2 = 180-kat1;
                                  controllerKatC.text=przytnijStr(kat2.toStringAsFixed(11));
                                }
                                else{
                                  kat2 = katC;
                                  kat1 = 180-kat2;
                                  controllerKatAB.text=przytnijStr(kat1.toStringAsFixed(11));
                                }
                                double pom = podstawaB-podstawaA;
                                tanges = tan(kat1*pi/180);
                                cosinus = cos(kat1*pi/180);
                                h = tanges*pom;
                                b = pom/cosinus;
                                p = (podstawaA+podstawaB)*h/2;
                                ob = podstawaA+podstawaB+(2*b);
                                b/=selectedJednostka3.mnoznik;
                                h/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = b.toStringAsFixed(11);
                                String x2 = h.toStringAsFixed(11);
                                String x3 = ob.toStringAsFixed(11);
                                String x4 = p.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
                                controllerWysokosc.text=przytnijStr(x2);
                                controllerObwod.text=przytnijStr(x3);
                                controllerPole.text=przytnijStr(x4);
                              }
                              else if((controllerPodstawaA.text!=''||controllerPodstawaB.text!='')&&controllerWysokosc.text!=''&&(controllerKatAB.text!=''||controllerKatC.text!='')){
                                if(controllerKatAB.text!=''){
                                  kat1 = katAB;
                                  kat2 = 180-kat1;
                                  controllerKatC.text=przytnijStr(kat2.toStringAsFixed(11));
                                }
                                else{
                                  kat2 = katC;
                                  kat1 = 180-kat2;
                                  controllerKatAB.text=przytnijStr(kat1.toStringAsFixed(11));
                                }
                                tanges = tan(kat1*pi/180);
                                cosinus = cos(kat1*pi/180);
                                double pom = wysokosc/tanges;
                                b = pom/cosinus;
                                if(controllerPodstawaA.text!=''){
                                  whatWasWrote='podstawaAwysokoscKat';
                                  a2 = podstawaA+pom+pom;
                                  a1 = podstawaA;
                                  a2/=selectedJednostka2.mnoznik;
                                  controllerPodstawaB.text=przytnijStr(a2.toStringAsFixed(11));
                                }
                                else{
                                  whatWasWrote='podstawaBwysokoscKat';
                                  a2 = podstawaB;
                                  a1 = podstawaB-pom-pom;
                                  a1/=selectedJednostka1.mnoznik;
                                  controllerPodstawaA.text=przytnijStr(a1.toStringAsFixed(11));
                                }
                                p = (a1+a2)*wysokosc/2;
                                ob = a1+a2+(2*b);
                                b/=selectedJednostka3.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = b.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                              }
                              else if((controllerPodstawaA.text!=''||controllerPodstawaB.text!='')&&controllerRamie.text!=''&&(controllerKatAB.text!=''||controllerKatC.text!='')){
                                if(controllerKatAB.text!=''){
                                  kat1 = katAB;
                                  kat2 = 180-kat1;
                                  controllerKatC.text=przytnijStr(kat2.toStringAsFixed(11));
                                }
                                else{
                                  kat2 = katC;
                                  kat1 = 180-kat2;
                                  controllerKatAB.text=przytnijStr(kat1.toStringAsFixed(11));
                                }
                                tanges = tan(kat1*pi/180);
                                cosinus = cos(kat1*pi/180);
                                double pom = cosinus*ramie;
                                h=pom*tanges;
                                if(controllerPodstawaA.text!=''){
                                  whatWasWrote='podstawaAramieKat';
                                  a2 = podstawaA+pom+pom;
                                  a1 = podstawaA;
                                  a2/=selectedJednostka2.mnoznik;
                                  controllerPodstawaB.text=przytnijStr(a2.toStringAsFixed(11));
                                }
                                else{
                                  whatWasWrote='podstawaBramieKat';
                                  a2 = podstawaB;
                                  a1 = podstawaB-pom-pom;
                                  a1/=selectedJednostka1.mnoznik;
                                  controllerPodstawaA.text=przytnijStr(a1.toStringAsFixed(11));
                                }
                                p = (a1+a2)*h/2;
                                ob = a1+a2+(2*ramie);
                                h/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = h.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                controllerWysokosc.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                              }
                              else if(controllerPodstawaA.text!=''&&controllerPodstawaB.text!=''&&controllerPrzekatna.text!=''){
                                whatWasWrote='podstawaApodstawaBprzekatna';
                                double pom = (podstawaA+((podstawaB-podstawaA)/2));
                                pom=pom*pom;
                                h = przekatna-pom;
                                h = sqrt(h);
                                p = (podstawaA+podstawaB)*h/2;
                                pom = podstawaB-podstawaA;
                                pom*=pom;
                                double pom2 = h*h;
                                b = pom+pom2;
                                b = sqrt(b);
                                ob = podstawaA+podstawaB+b+b;
                                sinus = h/b;
                                kat1 = asin(sinus);
                                kat1=kat1*180/pi;
                                kat2 = 180-kat1;
                                b/=selectedJednostka3.mnoznik;
                                h/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = b.toStringAsFixed(11);
                                String x2 = h.toStringAsFixed(11);
                                String x3 = ob.toStringAsFixed(11);
                                String x4 = p.toStringAsFixed(11);
                                String x5 = kat1.toStringAsFixed(11);
                                String x6 = kat2.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
                                controllerWysokosc.text=przytnijStr(x2);
                                controllerObwod.text=przytnijStr(x3);
                                controllerPole.text=przytnijStr(x4);
                                controllerKatAB.text=przytnijStr(x5);
                                controllerKatC.text=przytnijStr(x6);
                              }
                              else if(controllerPrzekatna.text!=''&&controllerKatPrzekatne.text!=''){
                                whatWasWrote='przekatnaKat';
                                kat3 = katPrzekatne*pi/180;
                                sinus = sin(kat3);
                                p = przekatna*przekatna*sinus/2;
                                p/=selectedJednostka6.mnoznik;
                                controllerPole.text=przytnijStr(p.toStringAsFixed(11));
                              }
                              else if(controllerPole.text!=''&&controllerPodstawaA.text!=''&&controllerPodstawaB.text!=''){
                                whatWasWrote='podstawaApodstawaBpole';
                                h = pole*2/(podstawaA+podstawaB);
                                double pom = (podstawaB-podstawaA)/2;
                                b = (pom*pom)+(h*h);
                                b=sqrt(b);
                                ob=podstawaA+podstawaB+b+b;
                                cosinus = pom/b;
                                kat1= acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                h/=selectedJednostka3.mnoznik;
                                b/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                controllerWysokosc.text=przytnijStr(h.toStringAsFixed(11));
                                controllerRamie.text=przytnijStr(b.toStringAsFixed(11));
                                controllerObwod.text=przytnijStr(ob.toStringAsFixed(11));
                                controllerKatAB.text=przytnijStr(kat1.toStringAsFixed(11));
                                controllerKatC.text=przytnijStr(kat2.toStringAsFixed(11));
                              }
                              else if(controllerPole.text!=''&&(controllerPodstawaA.text!=''||controllerPodstawaB.text!='')&&controllerWysokosc.text!=''){
                                if(controllerPodstawaA.text!=''){
                                  whatWasWrote='podstawaApoleWysokosc';
                                  a2=(pole*2/wysokosc)-podstawaA;
                                  a1=podstawaA;
                                  a2/=selectedJednostka2.mnoznik;
                                  controllerPodstawaB.text=przytnijStr(a2.toStringAsFixed(11));
                                }
                                else{
                                  whatWasWrote='podstawaBpoleWysokosc';
                                  a1=(pole*2/wysokosc)-podstawaB;
                                  a2=podstawaB;
                                  a1/=selectedJednostka1.mnoznik;
                                  controllerPodstawaA.text=przytnijStr(a1.toStringAsFixed(11));
                                }
                                double pom = (a2-a1)/2;
                                b = (pom*pom)+(wysokosc*wysokosc);
                                b=sqrt(b);
                                ob=a1+a2+b+b;
                                cosinus = pom/b;
                                kat1= acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                b/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                controllerRamie.text=przytnijStr(b.toStringAsFixed(11));
                                controllerObwod.text=przytnijStr(ob.toStringAsFixed(11));
                                controllerKatAB.text=przytnijStr(kat1.toStringAsFixed(11));
                                controllerKatC.text=przytnijStr(kat2.toStringAsFixed(11));
                              }
                              else if(controllerObwod.text!=''&&(controllerPodstawaA.text!=''||controllerPodstawaB.text!='')&&controllerRamie.text!=''){
                                if(controllerPodstawaA.text!=''){
                                  whatWasWrote='podstawaAobwodRamie';
                                  a2=obwod-ramie-ramie-podstawaA;
                                  a1=podstawaA;
                                  a2/=selectedJednostka2.mnoznik;
                                  controllerPodstawaB.text=przytnijStr(a2.toStringAsFixed(11));
                                }
                                else{
                                  whatWasWrote='podstawaBobwodRamie';
                                  a1=obwod-ramie-ramie-podstawaB;
                                  a2=podstawaB;
                                  a1/=selectedJednostka1.mnoznik;
                                  controllerPodstawaA.text=przytnijStr(a1.toStringAsFixed(11));
                                }
                                double pom = (a2-a1)/2;
                                h = (ramie*ramie) - (pom*pom);
                                h=sqrt(h);
                                cosinus = pom/ramie;
                                kat1= acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                h/=selectedJednostka3.mnoznik;
                                controllerWysokosc.text=przytnijStr(h.toStringAsFixed(11));
                                controllerKatAB.text=przytnijStr(kat1.toStringAsFixed(11));
                                controllerKatC.text=przytnijStr(kat2.toStringAsFixed(11));
                              }
                              else if(controllerRamie.text!=''&&(controllerKatAB.text!=''||controllerKatC.text!='')){
                                whatWasWrote='ramieKat';
                                if(controllerKatAB.text!=''){
                                  kat1=katAB;
                                  kat2=180-katAB;
                                  String x5 = kat2.toStringAsFixed(11);
                                  controllerKatC.text=przytnijStr(x5);
                                }
                                else{
                                  kat2=katC;
                                  kat1=180-katC;
                                  String x5 = kat1.toStringAsFixed(11);
                                  controllerKatAB.text=przytnijStr(x5);
                                }
                                sinus = sin(kat1/180*pi);
                                h=ramie*sinus;
                                h/=selectedJednostka3.mnoznik;
                                String x = h.toStringAsFixed(11);
                                controllerWysokosc.text=przytnijStr(x);
                              }
                              else if(controllerWysokosc.text!=''&&(controllerKatAB.text!=''||controllerKatC.text!='')){
                                whatWasWrote='wysokoscKat';
                                if(controllerKatAB.text!=''){
                                  kat1=katAB;
                                  kat2=180-katAB;
                                  String x5 = kat2.toStringAsFixed(11);
                                  controllerKatC.text=przytnijStr(x5);
                                }
                                else{
                                  kat2=katC;
                                  kat1=180-katC;
                                  String x5 = kat1.toStringAsFixed(11);
                                  controllerKatAB.text=przytnijStr(x5);
                                }
                                sinus = sin(kat1/180*pi);
                                b=wysokosc/sinus;
                                b/=selectedJednostka4.mnoznik;
                                String x = b.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
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
                                  child: Text('Górna podstawa',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='podstawaBpoleWysokosc'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="a=(2P/h)-b";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaBobwodRamie'){
                                    pierwszaLinia="Ob=a+b+2c";
                                    drugaLinia="a=Ob-(b+2c)";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='podstawaBwysokoscRamie'){
                                    pierwszaLinia="c<sup><small><small>2</small></small></sup>=h<sup><small><small>2</small></small></sup>+((a-b)/2)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="((a-b)/2)<sup><small><small>2</small></small></sup>=c<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="";
                                    czwartaLinia="";
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
                                  child: Text('Dolna podstawa',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {

                                  if(whatWasWrote=='podstawaApoleWysokosc'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="b=(2P/h)-a";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaAobwodRamie'){
                                    pierwszaLinia="Ob=a+b+2c";
                                    drugaLinia="b=Ob-(a+2c)";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='podstawaAwysokoscRamie'){
                                    pierwszaLinia="c<sup><small><small>2</small></small></sup>=h<sup><small><small>2</small></small></sup>+((a-b)/2)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="((a-b)/2)<sup><small><small>2</small></small></sup>=c<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="b=a-(a-b)";
                                    czwartaLinia="";
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
                                  if(whatWasWrote=='podstawaApodstawaBpole'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="h=2P/(a+b)";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBramie'){
                                    pierwszaLinia="c<sup><small><small>2</small></small></sup>=h<sup><small><small>2</small></small></sup>+((a-b)/2)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="h<sup><small><small>2</small></small></sup>=c<sup><small><small>2</small></small></sup>-((a-b)/2)<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBkat'){
                                    pierwszaLinia="tan&#946;=((a-b)/2)/h";
                                    drugaLinia="h=((a-b)/2)/tan&#946;";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='ramieKat'){
                                    pierwszaLinia="sin&#946;=h/c";
                                    drugaLinia="h=sin&#946;*c";
                                    trzeciaLinia='';
                                    czwartaLinia="";
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
                                  child: Text('Ramię',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='podstawaApodstawaBpole'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="h=2P/(a+b)";
                                    trzeciaLinia="c<sup><small><small>2</small></small></sup>=((a-b)/2)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBwysokosc'){
                                    pierwszaLinia="c<sup><small><small>2</small></small></sup>=((a-b)/2)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaApoleWysokosc'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="a=(2P/h)-b";
                                    trzeciaLinia="c<sup><small><small>2</small></small></sup>=((a-b)/2)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaBpoleWysokosc'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="b=(2P/h)-a";
                                    trzeciaLinia="c<sup><small><small>2</small></small></sup>=((a-b)/2)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokoscKat'){
                                    pierwszaLinia="sin&#946;=h/c";
                                    drugaLinia="c=h/sin&#946;";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBkat'){
                                    pierwszaLinia="cos&#946;=((a-b)/2)/c";
                                    drugaLinia="c=((a-b)/2)/cos&#946;";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBobwod'){
                                    pierwszaLinia="cos&#946;=((a-b)/2)/c";
                                    drugaLinia="c=((a-b)/2)/cos&#946;";
                                    trzeciaLinia="";
                                    czwartaLinia="";
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
                                  child: Text('Pole',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='podstawaApodstawaBramie'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="c<sup><small><small>2</small></small></sup>=((a-b)/2)<sup><small><small>2</small></small></sup>+h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="h<sup><small><small>2</small></small></sup>=c<sup><small><small>2</small></small></sup>-((a-b)/2)<sup><small><small>2</small></small></sup>";
                                    czwartaLinia="P=(a+b)*h/2";
                                  }
                                  else if(whatWasWrote=='podstawaAwysokoscRamie'){
                                    pierwszaLinia="c<sup><small><small>2</small></small></sup>=h<sup><small><small>2</small></small></sup>+((a-b)/2)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="((a-b)/2)<sup><small><small>2</small></small></sup>=c<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="a=b+(a-b)";
                                    czwartaLinia="P=(a+b)*h/2";
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBwysokosc'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBkat'){
                                    pierwszaLinia="P=(a+b)*h/2";
                                    drugaLinia="tg&#946;=h/((a-b)/2)";
                                    trzeciaLinia="h=tg&#946;*((a-b)/2)";
                                    czwartaLinia="P=(a+b)*h/2";
                                  }
                                  else if(whatWasWrote=='podstawaApodstawaBprzekatna'){
                                    pierwszaLinia="h<sup><small><small>2</small></small></sup>=d<sup><small><small>2</small></small></sup>-(b+((a-b)/2)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="P=(a+b)*h/2";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaBwysokoscKat'){
                                    pierwszaLinia="tg&#946;=h/((a-b)/2)";
                                    drugaLinia="((a-b)/2)=h/tg&#946;";
                                    trzeciaLinia="b=a-(a-b)";
                                    czwartaLinia="P=(a+b)*h/2";
                                  }
                                  else if(whatWasWrote=='podstawaAwysokoscKat'){
                                    pierwszaLinia="tg&#946;=h/((a-b)/2)";
                                    drugaLinia="((a-b)/2)=h/tg&#946;";
                                    trzeciaLinia="a=b+(a-b)";
                                    czwartaLinia="P=(a+b)*h/2";
                                  }
                                  else if(whatWasWrote=='podstawaBramieKat'){
                                    pierwszaLinia="sin&#946;=h/c";
                                    drugaLinia="cos&#946;=((a-b)/2)/c";
                                    trzeciaLinia="b=a-(a-b)";
                                    czwartaLinia="P=(a+b)*h/2";
                                  }
                                  else if(whatWasWrote=='podstawaAramieKat'){
                                    pierwszaLinia="sin&#946;=h/c";
                                    drugaLinia="cos&#946;=((a-b)/2)/c";
                                    trzeciaLinia="a=b+(a-b)";
                                    czwartaLinia="P=(a+b)*h/2";
                                  }
                                  else if(whatWasWrote=='przekatnaKat'){
                                    pierwszaLinia="P=d<sup><small><small>2</small></small></sup>*sin&#947;/2";
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
  Jednostka selectedJednostka1,selectedJednostka2,selectedJednostka3,selectedJednostka4,selectedJednostka5,selectedJednostka6, selectedJednostka7;
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
      podstawaA/=selectedJednostka1.mnoznik;
      selectedJednostka1 = selectedJednostkaPom;
      podstawaA*=selectedJednostka1.mnoznik;
    });
  }
  onChangeDropdownItem2(Jednostka selectedJednostkaPom) {
    setState(() {
      podstawaB/=selectedJednostka2.mnoznik;
      selectedJednostka2 = selectedJednostkaPom;
      podstawaB*=selectedJednostka2.mnoznik;
    });
  }
  onChangeDropdownItem3(Jednostka selectedJednostkaPom) {
    setState(() {
      ramie/=selectedJednostka3.mnoznik;
      selectedJednostka3 = selectedJednostkaPom;
      ramie*=selectedJednostka3.mnoznik;
    });
  }
  onChangeDropdownItem4(Jednostka selectedJednostkaPom) {
    setState(() {
      wysokosc/=selectedJednostka4.mnoznik;
      selectedJednostka4 = selectedJednostkaPom;
      wysokosc*=selectedJednostka4.mnoznik;
    });
  }
  onChangeDropdownItem5(Jednostka selectedJednostkaPom) {
    setState(() {
      obwod/=selectedJednostka5.mnoznik;
      selectedJednostka5 = selectedJednostkaPom;
      obwod*=selectedJednostka5.mnoznik;
    });
  }
  onChangeDropdownItem6(Jednostka selectedJednostkaPom) {
    setState(() {
      pole/=selectedJednostka6.mnoznik;
      selectedJednostka6 = selectedJednostkaPom;
      pole*=selectedJednostka6.mnoznik;
    });
  }
  onChangeDropdownItem7(Jednostka selectedJednostkaPom) {
    setState(() {
      przekatna/=selectedJednostka7.mnoznik;
      selectedJednostka7 = selectedJednostkaPom;
      przekatna*=selectedJednostka7.mnoznik;
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
    selectedJednostka5 = _dropdownMenuItems[1].value;
    selectedJednostka6 = _dropdownMenuItems2[1].value;
    selectedJednostka7 = _dropdownMenuItems[1].value;
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
