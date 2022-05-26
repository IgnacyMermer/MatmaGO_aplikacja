import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter/services.dart';
import 'dart:math';
class TrapezProstokatny extends StatefulWidget {
  final Function comeBack;
  TrapezProstokatny({this.comeBack});
  @override
  _TrapezProstokatnyState createState() => _TrapezProstokatnyState();
}
class _TrapezProstokatnyState extends State<TrapezProstokatny> {
  double podstawaA=-1,podstawaB=-1,ramie=-1, wysokosc=-1, pole=-1, obwod=-1,katAB=-1, katC=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerPodstawaA = TextEditingController(),controllerPodstawaB = TextEditingController();
  TextEditingController controllerRamie = TextEditingController(),controllerWysokosc = TextEditingController();
  TextEditingController controllerKatAB = TextEditingController(),controllerKatC = TextEditingController();
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
                              controllerPodstawaA = new TextEditingController();
                              controllerPodstawaB = new TextEditingController();
                              controllerRamie = new TextEditingController();
                              controllerObwod = new TextEditingController();
                              controllerPole = new TextEditingController();
                              controllerWysokosc = new TextEditingController();
                              controllerKatAB = new TextEditingController();
                              controllerKatC = new TextEditingController();
                              podstawaA=-1;
                              podstawaB=-1;
                              ramie=-1;
                              obwod=-1;
                              pole=-1;
                              wysokosc=-1;
                              katAB=-1;
                              katC=-1;
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
                                      focusNode: focus8,
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
                              if(controllerPodstawaA.text!=''&&controllerPodstawaB.text!=''&&controllerWysokosc.text!=''){
                                whatWasWrote='podstawaApodstawaBwysokosc';
                                p=(podstawaA+podstawaB)*wysokosc/2;
                                double pom = podstawaB-podstawaA;
                                tanges = wysokosc/pom;
                                kat1 = atan(tanges);
                                cosinus = cos(kat1);
                                b = pom/cosinus;
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                ob = podstawaA+podstawaB+wysokosc+b;
                                b/=selectedJednostka4.mnoznik;
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
                                  kat1=katAB;
                                  kat2=180-katAB;
                                  String x6 = kat2.toStringAsFixed(11);
                                  controllerKatC.text=przytnijStr(x6);
                                }
                                else{
                                  kat2=katC;
                                  kat1=180-katC;
                                  String x6 = kat1.toStringAsFixed(11);
                                  controllerKatAB.text=przytnijStr(x6);
                                }
                                double pom = podstawaB-podstawaA;
                                kat1 = kat1*pi/180;
                                tanges = tan(kat1);
                                h = tanges*pom;
                                p=(podstawaA+podstawaB)*h/2;
                                cosinus = cos(kat1);
                                b = pom/cosinus;
                                ob = podstawaA+podstawaB+wysokosc+b;
                                h/=selectedJednostka3.mnoznik;
                                b/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = b.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                String x4 = h.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerWysokosc.text=przytnijStr(x4);
                              }
                              else if((controllerPodstawaA.text!=''||controllerPodstawaB.text!='')&&(controllerKatAB.text!=''||controllerKatC.text!='')&&controllerWysokosc.text!=''){
                                if(controllerKatAB.text!=''){
                                  kat1=katAB;
                                  kat2=180-katAB;
                                  String x6 = kat2.toStringAsFixed(11);
                                  controllerKatC.text=przytnijStr(x6);
                                }
                                else{
                                  kat2=katC;
                                  kat1=180-katC;
                                  String x6 = kat1.toStringAsFixed(11);
                                  controllerKatAB.text=przytnijStr(x6);
                                }
                                tanges = tan(kat1*pi/180);
                                double pom = wysokosc/tanges;
                                if(controllerPodstawaA.text!=''){
                                  whatWasWrote='podstawaAkatWysokosc';
                                  a1 = podstawaA;
                                  a2 = podstawaA+pom;
                                  String x6 = a2.toStringAsFixed(11);
                                  controllerPodstawaB.text=przytnijStr(x6);
                                }
                                else{
                                  whatWasWrote='podstawaBkatWysokosc';
                                  a1 = podstawaB-pom;
                                  a2 = podstawaB;
                                  String x6 = a1.toStringAsFixed(11);
                                  controllerPodstawaA.text=przytnijStr(x6);
                                }
                                p=(a1+a2)*wysokosc/2;
                                cosinus = cos(kat1*pi/180);
                                b = pom/cosinus;
                                ob = podstawaA+podstawaB+wysokosc+b;
                                b/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = b.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                controllerRamie.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                              }
                              else if((controllerPodstawaA.text!=''||controllerPodstawaB.text!='')&&(controllerKatAB.text!=''||controllerKatC.text!='')&&controllerRamie.text!=''){
                                if(controllerKatAB.text!=''){
                                  kat1=katAB;
                                  kat2=180-katAB;
                                  String x6 = kat2.toStringAsFixed(11);
                                  controllerKatC.text=przytnijStr(x6);
                                }
                                else{
                                  kat2=katC;
                                  kat1=180-katC;
                                  String x6 = kat1.toStringAsFixed(11);
                                  controllerKatAB.text=przytnijStr(x6);
                                }
                                cosinus = cos(kat1*pi/180);
                                double pom = ramie/cosinus;
                                if(controllerPodstawaA.text!=''){
                                  whatWasWrote='podstawaAkatRamie';
                                  a1 = podstawaA;
                                  a2 = podstawaA+pom;
                                  String x6 = a2.toStringAsFixed(11);
                                  controllerPodstawaB.text=przytnijStr(x6);
                                }
                                else{
                                  whatWasWrote='podstawaBkatRamie';
                                  a1 = podstawaB-pom;
                                  a2 = podstawaB;
                                  String x6 = a1.toStringAsFixed(11);
                                  controllerPodstawaA.text=przytnijStr(x6);
                                }
                                tanges = tan(kat1*pi/180);
                                h = pom*tanges;
                                p=(a1+a2)*h/2;
                                ob = podstawaA+podstawaB+h+ramie;
                                h/=selectedJednostka3.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = h.toStringAsFixed(11);
                                String x2 = ob.toStringAsFixed(11);
                                String x3 = p.toStringAsFixed(11);
                                controllerWysokosc.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                              }
                              else if(controllerPodstawaA.text!=''&&controllerPodstawaB.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='podstawaApodstawaBRamie';
                                double pom = podstawaB-podstawaA;
                                h = (ramie*ramie)-(pom*pom);
                                h=sqrt(h);
                                p=(podstawaA+podstawaB)*h/2;
                                ob=podstawaA+podstawaB+ramie+h;
                                cosinus = pom/ramie;
                                kat1 = acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                h/=selectedJednostka3.mnoznik;
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
                              else if(controllerPodstawaA.text!=''&&controllerPodstawaB.text!=''&&controllerPole.text!=''){
                                whatWasWrote='podstawaApodstawaBpole';
                                h=2*pole/(podstawaA+podstawaB);
                                double pom = podstawaB-podstawaA;
                                tanges = h/pom;
                                kat1 = atan(tanges);
                                cosinus = cos(kat1);
                                b = pom/cosinus;
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                ob=podstawaA+podstawaB+b+h;
                                h/=selectedJednostka3.mnoznik;
                                b/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka5.mnoznik;
                                String x = ob.toStringAsFixed(11);
                                String x2 = h.toStringAsFixed(11);
                                String x3 = b.toStringAsFixed(11);
                                String x4 = kat1.toStringAsFixed(11);
                                String x5 = kat2.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                                controllerWysokosc.text=przytnijStr(x2);
                                controllerRamie.text=przytnijStr(x3);
                                controllerKatAB.text=przytnijStr(x4);
                                controllerKatC.text=przytnijStr(x5);
                              }
                              else if((controllerPodstawaA.text!=''||controllerPodstawaB.text!='')&&controllerWysokosc.text!=''&&controllerRamie.text!=''){
                                double pom;
                                if(controllerPodstawaA.text!=''){
                                  whatWasWrote='podstawaAwysokoscRamie';
                                  pom = (ramie*ramie)-(wysokosc*wysokosc);
                                  pom=sqrt(pom);
                                  a2 = podstawaA+pom;
                                  a1 = podstawaA;
                                  a2/=selectedJednostka2.mnoznik;
                                  String x6 = a2.toStringAsFixed(11);
                                  controllerPodstawaB.text=przytnijStr(x6);
                                }
                                else{
                                  whatWasWrote='podstawaBwysokoscRamie';
                                  pom = (ramie*ramie)-(wysokosc*wysokosc);
                                  pom=sqrt(pom);
                                  a2 = podstawaB;
                                  a1 = podstawaB-pom;
                                  a1/=selectedJednostka1.mnoznik;
                                  String x6 = a1.toStringAsFixed(11);
                                  controllerPodstawaA.text=przytnijStr(x6);
                                }
                                cosinus = pom/ramie;
                                kat1 = acos(cosinus);
                                kat1=kat1*180/pi;
                                kat2 = 180-kat1;
                                ob=a1+a2+ramie+wysokosc;
                                p=(a1+a2)*wysokosc/2;
                                ob/=selectedJednostka5.mnoznik;
                                p/=selectedJednostka6.mnoznik;
                                String x = ob.toStringAsFixed(11);
                                String x2 = p.toStringAsFixed(11);
                                String x3 = kat1.toStringAsFixed(11);
                                String x4 = kat2.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                                controllerPole.text=przytnijStr(x2);
                                controllerKatAB.text=przytnijStr(x3);
                                controllerKatC.text=przytnijStr(x4);
                              }
                              else if(controllerWysokosc.text!=''&&controllerRamie.text!=''){
                                whatWasWrote='wysokoscRamie';
                                sinus = wysokosc/ramie;
                                kat1=asin(sinus);
                                kat1=kat1*180/pi;
                                kat2=180-kat1;
                                String x = kat1.toStringAsFixed(11);
                                String x2 = kat2.toStringAsFixed(11);
                                controllerKatAB.text=przytnijStr(x);
                                controllerKatC.text=przytnijStr(x2);
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
                                  if(whatWasWrote=='podstawaBwysokoscRamie'){
                                    pierwszaLinia="c<sup><small><small>2</small></small></sup>=h<sup><small><small>2</small></small></sup>+(a-b)<sup><small><small>2</small></small></sup>";
                                    drugaLinia="(a-b)<sup><small><small>2</small></small></sup>=c<sup><small><small>2</small></small></sup>-h<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia="";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='podstawaBkatWysokosc'){
                                    pierwszaLinia="tg&#946;=h/(a-b)";
                                    drugaLinia="(a-b)=h/tg&#946;";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='podstawaBkatRamie'){
                                    pierwszaLinia="cos&#946;=(a-b)/c";
                                    drugaLinia="(a-b)=c*cos&#946;";
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
                                  child: Text('Dolna podstawa',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {

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
