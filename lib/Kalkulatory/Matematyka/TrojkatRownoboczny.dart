import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter/services.dart';
import 'dart:math';
class TrojkatRownoboczny extends StatefulWidget {
  final Function comeBack;
  TrojkatRownoboczny({this.comeBack});
  @override
  _TrojkatRownobocznyState createState() => _TrojkatRownobocznyState();
}
class _TrojkatRownobocznyState extends State<TrojkatRownoboczny> {
  double bok=-1, wysokosc=-1, pole=-1, obwod=-1,prWpis=-1, prOpis=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerBok = TextEditingController(),controllerWysokosc = TextEditingController();
  TextEditingController controllerPrWpis = TextEditingController(),controllerPrOpis = TextEditingController();
  FocusNode focus1,focus2,focus3,focus4,focus5,focus6;
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
                              controllerWysokosc=new TextEditingController();
                              controllerPrWpis=new TextEditingController();
                              controllerPrOpis=new TextEditingController();
                              bok=-1;
                              obwod=-1;
                              pole=-1;
                              wysokosc=-1;
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
                                        obwod*=selectedJednostka2.mnoznik;
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
                                        pole*=selectedJednostka3.mnoznik;
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
                                  value: selectedJednostka3,
                                  items: _dropdownMenuItems2,
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
                                        prWpis*=selectedJednostka5.mnoznik;
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
                                        prOpis*=selectedJednostka6.mnoznik;
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
                              double a,r1,r2,ob,p,h;
                              if(controllerBok.text!=''){
                                whatWasWrote='bok';
                                a=bok;
                                p=a*a/4*sqrt(3);
                                ob=4*a;
                                h=a/2*sqrt(3);
                                r1=a/6*sqrt(3);
                                r2=a/3*sqrt(3);
                                p/=selectedJednostka3.mnoznik;
                                ob/=selectedJednostka2.mnoznik;
                                h/=selectedJednostka4.mnoznik;
                                r1/=selectedJednostka5.mnoznik;
                                r2/=selectedJednostka6.mnoznik;
                                String x= p.toStringAsFixed(11);
                                String x2= ob.toStringAsFixed(11);
                                String x3= h.toStringAsFixed(11);
                                String x4= r1.toStringAsFixed(11);
                                String x5= r2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerObwod.text=przytnijStr(x2);
                                controllerWysokosc.text=przytnijStr(x3);
                                controllerPrWpis.text=przytnijStr(x4);
                                controllerPrOpis.text=przytnijStr(x5);
                              }
                              else if(controllerObwod.text!=''){
                                whatWasWrote='obwod';
                                a=obwod/4;
                                p=a*a/4*sqrt(3);
                                h=a/2*sqrt(3);
                                r1=a/6*sqrt(3);
                                r2=a/3*sqrt(3);
                                p/=selectedJednostka3.mnoznik;
                                a/=selectedJednostka1.mnoznik;
                                h/=selectedJednostka4.mnoznik;
                                r1/=selectedJednostka5.mnoznik;
                                r2/=selectedJednostka6.mnoznik;
                                String x= p.toStringAsFixed(11);
                                String x2= a.toStringAsFixed(11);
                                String x3= h.toStringAsFixed(11);
                                String x4= r1.toStringAsFixed(11);
                                String x5= r2.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                                controllerBok.text=przytnijStr(x2);
                                controllerWysokosc.text=przytnijStr(x3);
                                controllerPrWpis.text=przytnijStr(x4);
                                controllerPrOpis.text=przytnijStr(x5);
                              }
                              else if(controllerPole.text!=''){
                                whatWasWrote='pole';
                                a=pole*4/sqrt(3);
                                a=sqrt(a);
                                a=double.parse(a.toStringAsFixed(5));
                                ob=4*a;
                                h=a/2*sqrt(3);
                                r1=a/6*sqrt(3);
                                r2=a/3*sqrt(3);
                                a/=selectedJednostka1.mnoznik;
                                ob/=selectedJednostka2.mnoznik;
                                h/=selectedJednostka4.mnoznik;
                                r1/=selectedJednostka5.mnoznik;
                                r2/=selectedJednostka6.mnoznik;
                                String x= ob.toStringAsFixed(11);
                                String x2= a.toStringAsFixed(11);
                                String x3= h.toStringAsFixed(11);
                                String x4= r1.toStringAsFixed(11);
                                String x5= r2.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                                controllerBok.text=przytnijStr(x2);
                                controllerWysokosc.text=przytnijStr(x3);
                                controllerPrWpis.text=przytnijStr(x4);
                                controllerPrOpis.text=przytnijStr(x5);
                              }
                              else if(controllerWysokosc.text!=''){
                                whatWasWrote='wysokosc';
                                a=wysokosc*2/sqrt(3);
                                a=double.parse(a.toStringAsFixed(5));
                                ob=4*a;
                                p=a*a/4*sqrt(3);
                                r1=a/6*sqrt(3);
                                r2=a/3*sqrt(3);
                                a/=selectedJednostka1.mnoznik;
                                ob/=selectedJednostka2.mnoznik;
                                p/=selectedJednostka3.mnoznik;
                                r1/=selectedJednostka5.mnoznik;
                                r2/=selectedJednostka6.mnoznik;
                                String x= ob.toStringAsFixed(11);
                                String x2= a.toStringAsFixed(11);
                                String x3= p.toStringAsFixed(11);
                                String x4= r1.toStringAsFixed(11);
                                String x5= r2.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                                controllerBok.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerPrWpis.text=przytnijStr(x4);
                                controllerPrOpis.text=przytnijStr(x5);
                              }
                              else if(controllerPrWpis.text!=''){
                                whatWasWrote='promienWp';
                                a=prWpis*6/sqrt(3);
                                a=double.parse(a.toStringAsFixed(5));
                                ob=4*a;
                                p=a*a/4*sqrt(3);
                                h=prWpis*3;
                                r2=2*prWpis;
                                a/=selectedJednostka1.mnoznik;
                                ob/=selectedJednostka2.mnoznik;
                                p/=selectedJednostka3.mnoznik;
                                h/=selectedJednostka4.mnoznik;
                                r2/=selectedJednostka6.mnoznik;
                                String x= ob.toStringAsFixed(11);
                                String x2= a.toStringAsFixed(11);
                                String x3= p.toStringAsFixed(11);
                                String x4= h.toStringAsFixed(11);
                                String x5= r2.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                                controllerBok.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerWysokosc.text=przytnijStr(x4);
                                controllerPrOpis.text=przytnijStr(x5);
                              }
                              else if(controllerPrOpis.text!=''){
                                whatWasWrote='promienOp';
                                a=prOpis*3/sqrt(3);
                                a=double.parse(a.toStringAsFixed(5));
                                ob=4*a;
                                p=a*a/4*sqrt(3);
                                r1=prOpis/2;
                                h=prOpis*3/2;
                                a/=selectedJednostka1.mnoznik;
                                ob/=selectedJednostka2.mnoznik;
                                p/=selectedJednostka3.mnoznik;
                                r1/=selectedJednostka5.mnoznik;
                                h/=selectedJednostka4.mnoznik;
                                String x= ob.toStringAsFixed(11);
                                String x2= a.toStringAsFixed(11);
                                String x3= p.toStringAsFixed(11);
                                String x4= r1.toStringAsFixed(11);
                                String x5= h.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                                controllerBok.text=przytnijStr(x2);
                                controllerPole.text=przytnijStr(x3);
                                controllerPrWpis.text=przytnijStr(x4);
                                controllerWysokosc.text=przytnijStr(x5);
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
                                  if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>&#8730;3/4";
                                    drugaLinia="a<sup><small><small>2</small></small></sup>=4*P/&#8730;3";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia='a=Ob/4';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokosc'){
                                    pierwszaLinia="h=a&#8730;3/2";
                                    drugaLinia="a=h*2/&#8730;3";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienWp'){
                                    pierwszaLinia="r=a&#8730;3/6";
                                    drugaLinia="a=r*6/&#8730;3";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienOp'){
                                    pierwszaLinia="r=a&#8730;3/3";
                                    drugaLinia="a=r*3/&#8730;3";
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
                                  child: Text('Wysokość',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>&#8730;3/4";
                                    drugaLinia="a<sup><small><small>2</small></small></sup>=4*P/&#8730;3";
                                    trzeciaLinia='h=a&#8730;3/2';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia='a=Ob/4';
                                    drugaLinia='h=a&#8730;3/2';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bok'){
                                    pierwszaLinia="h=a&#8730;3/2";
                                    drugaLinia="";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienWp'){
                                    pierwszaLinia="r=&frac23;*h";
                                    drugaLinia="h=r*6";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienOp'){
                                    pierwszaLinia="r=&frac13;*h";
                                    drugaLinia="h=r*3/2";
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
                                  if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>&#8730;3/4";
                                    drugaLinia="a<sup><small><small>2</small></small></sup>=4*P/&#8730;3";
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokosc'){
                                    pierwszaLinia='h=a&#8730;3/2';
                                    drugaLinia='a=2h/&#8730;3';
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bok'){
                                    pierwszaLinia="Ob=4a";
                                    drugaLinia="";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienWp'){
                                    pierwszaLinia="r=a&#8730;3/6";
                                    drugaLinia="a=6r/&#8730;3";
                                    trzeciaLinia='Ob=4a';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienOp'){
                                    pierwszaLinia="r=a&#8730;3/3";
                                    drugaLinia="a=3r/&#8730;3";
                                    trzeciaLinia='Ob=4a';
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
                                  if(whatWasWrote=='bok'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>&#8730;3/4";
                                    drugaLinia="";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokosc'){
                                    pierwszaLinia='h=a&#8730;3/2';
                                    drugaLinia='a=2h/&#8730;3';
                                    trzeciaLinia='P=a<sup><small><small>2</small></small></sup>&#8730;3/4';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia="a=Ob/4";
                                    drugaLinia="P=a<sup><small><small>2</small></small></sup>&#8730;3/4";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienWp'){
                                    pierwszaLinia="r=a&#8730;3/6";
                                    drugaLinia="a=6r/&#8730;3";
                                    trzeciaLinia='P=a<sup><small><small>2</small></small></sup>&#8730;3/4';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienOp'){
                                    pierwszaLinia="r=a&#8730;3/3";
                                    drugaLinia="a=3r/&#8730;3";
                                    trzeciaLinia='P=a<sup><small><small>2</small></small></sup>&#8730;3/4';
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
                                  child: Text('Promień wpis.',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='bok'){
                                    pierwszaLinia="r=a&#8730;3/6";
                                    drugaLinia="";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokosc'){
                                    pierwszaLinia='r=&frac13*h';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia="a=Ob/4";
                                    drugaLinia="r=a&#8730;3/6";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>&#8730;3/4";
                                    drugaLinia="a<sup><small><small>2</small></small></sup>=4*P/&#8730;3";
                                    trzeciaLinia='r=a&#8730;3/6';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienOp'){
                                    pierwszaLinia="r=&frac12*R";
                                    drugaLinia="";
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
                                  child: Text('Promień opis.',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                unFocusAll();
                                setState(() {
                                  if(whatWasWrote=='bok'){
                                    pierwszaLinia="R=a&#8730;3/3";
                                    drugaLinia="";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='wysokosc'){
                                    pierwszaLinia='R=&frac23*h';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia="a=Ob/4";
                                    drugaLinia="R=a&#8730;3/3";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a<sup><small><small>2</small></small></sup>&#8730;3/4";
                                    drugaLinia="a<sup><small><small>2</small></small></sup>=4*P/&#8730;3";
                                    trzeciaLinia='R=a&#8730;3/3';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='promienWp'){
                                    pierwszaLinia="R=2r";
                                    drugaLinia="";
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
      bok/=selectedJednostka1.mnoznik;
      selectedJednostka1 = selectedJednostkaPom;
      bok*=selectedJednostka1.mnoznik;
    });
  }
  onChangeDropdownItem2(Jednostka selectedJednostkaPom) {
    setState(() {
      obwod/=selectedJednostka2.mnoznik;
      selectedJednostka2 = selectedJednostkaPom;
      obwod*=selectedJednostka2.mnoznik;
    });
  }
  onChangeDropdownItem3(Jednostka selectedJednostkaPom) {
    setState(() {
      pole/=selectedJednostka3.mnoznik;
      selectedJednostka3 = selectedJednostkaPom;
      pole*=selectedJednostka3.mnoznik;
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
      prWpis/=selectedJednostka5.mnoznik;
      selectedJednostka5 = selectedJednostkaPom;
      prWpis*=selectedJednostka5.mnoznik;
    });
  }
  onChangeDropdownItem6(Jednostka selectedJednostkaPom) {
    setState(() {
      prOpis/=selectedJednostka6.mnoznik;
      selectedJednostka6 = selectedJednostkaPom;
      prOpis*=selectedJednostka6.mnoznik;
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
    selectedJednostka3 = _dropdownMenuItems2[1].value;
    selectedJednostka4 = _dropdownMenuItems[1].value;
    selectedJednostka5 = _dropdownMenuItems[1].value;
    selectedJednostka6 = _dropdownMenuItems[1].value;
  }
  void unFocusAll(){
    focus1.unfocus();
    focus2.unfocus();
    focus3.unfocus();
    focus4.unfocus();
    focus5.unfocus();
    focus6.unfocus();
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
