import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:math';
import 'package:flutter_html/style.dart';
class Kwadrat extends StatefulWidget {
  Function comeBack;
  Kwadrat({this.comeBack});
  @override
  _KwadratState createState() => _KwadratState();
}
class _KwadratState extends State<Kwadrat> {
  double bok=-1, przekatna=-1, pole=-1, obwod=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerBok = TextEditingController(),controllerPrzekatna = TextEditingController();
  FocusNode focus1,focus2,focus3,focus4;
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
  }
  @override
  void dispose() {
    super.dispose();
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
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
                          controllerPrzekatna=new TextEditingController();
                          bok=-1;
                          obwod=-1;
                          pole=-1;
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
                                  focus1.unfocus();
                                  focus2.unfocus();
                                  focus3.unfocus();
                                  focus4.unfocus();
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
                                  focus1.unfocus();
                                  focus2.unfocus();
                                  focus3.unfocus();
                                  focus4.unfocus();
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
                                    przekatna*=selectedJednostka4.mnoznik;
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
                        focus1.unfocus();
                        focus2.unfocus();
                        focus3.unfocus();
                        focus4.unfocus();
                        setState(() {
                          double a,d,ob,p;
                          if(controllerPole.text!=''&&(controllerBok.text==''||controllerPrzekatna.text==''||controllerObwod.text=='')){
                            whatWasWrote='pole';
                            a = sqrt(pole);
                            d=sqrt(pole*2);
                            ob=4*a;
                            a/=selectedJednostka1.mnoznik;
                            ob/=selectedJednostka2.mnoznik;
                            d/=selectedJednostka4.mnoznik;
                            String pom = a.toStringAsFixed(11);
                            String pom2=d.toStringAsFixed(11);
                            String pom3 = ob.toStringAsFixed(11);
                            controllerBok.text=przytnijStr(pom);
                            controllerPrzekatna.text=przytnijStr(pom2);
                            controllerObwod.text=przytnijStr(pom3);
                          }
                          else if(controllerObwod.text!=''&&(controllerBok.text==''||controllerPrzekatna.text==''||controllerPole.text=='')){
                            whatWasWrote='obwod';
                            a = obwod/4;
                            p=a*a;
                            d=a*sqrt(2);
                            a/=selectedJednostka1.mnoznik;
                            p/=selectedJednostka3.mnoznik;
                            d/=selectedJednostka4.mnoznik;
                            String pom = a.toStringAsFixed(11);
                            String pom2=d.toStringAsFixed(11);
                            String pom3 = p.toStringAsFixed(11);
                            controllerBok.text=przytnijStr(pom);
                            controllerPrzekatna.text=przytnijStr(pom2);
                            controllerPole.text=przytnijStr(pom3);
                          }
                          else if(controllerPrzekatna.text!=''&&(controllerBok.text==''||controllerPole.text==''||controllerObwod.text=='')){
                            whatWasWrote='przekatna';
                            a=przekatna/sqrt(2);
                            p=przekatna*przekatna/2;
                            ob=4*a;
                            a/=selectedJednostka1.mnoznik;
                            ob/=selectedJednostka2.mnoznik;
                            p/=selectedJednostka3.mnoznik;
                            String pom = a.toStringAsFixed(11);
                            String pom2 = p.toStringAsFixed(11);
                            String pom3 = ob.toStringAsFixed(11);
                            controllerBok.text=przytnijStr(pom);
                            controllerPole.text=przytnijStr(pom2);
                            controllerObwod.text=przytnijStr(pom3);
                          }
                          else if(controllerBok.text!=''&&(controllerPole.text==''||controllerPrzekatna.text==''||controllerObwod.text=='')){
                            whatWasWrote='bok';
                            d=bok*sqrt(2);
                            p=bok*bok;
                            ob=4*bok;
                            p/=selectedJednostka3.mnoznik;
                            ob/=selectedJednostka2.mnoznik;
                            d/=selectedJednostka4.mnoznik;
                            String pom = d.toStringAsFixed(11);
                            String pom2 = p.toStringAsFixed(11);
                            String pom3 = ob.toStringAsFixed(11);
                            controllerPrzekatna.text=przytnijStr(pom);
                            controllerPole.text=przytnijStr(pom2);
                            controllerObwod.text=przytnijStr(pom3);
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
                            setState(() {
                              selectedJednostka5=_dropdownMenuItems[1].value;
                              double a;
                              if(whatWasWrote=='pole'){
                                pierwszaLinia="P=a<sup><small><small>2</small></small></sup>";
                                drugaLinia="a=&#8730;P";
                                trzeciaLinia="";
                                czwartaLinia="";
                                a = sqrt(pole);
                                a/=selectedJednostka5.mnoznik;
                                wynik = a.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='obwod'){
                                pierwszaLinia="Ob=4a";
                                drugaLinia="a=Ob/4";
                                trzeciaLinia="";
                                czwartaLinia="";
                                a = obwod/4;
                                a/=selectedJednostka5.mnoznik;
                                wynik = a.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='przekatna'){
                                pierwszaLinia="d=a&#8730;2";
                                drugaLinia="a=d/&#8730;2";
                                trzeciaLinia="";
                                czwartaLinia="";
                                a=przekatna/sqrt(2);
                                a/=selectedJednostka5.mnoznik;
                                wynik = a.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
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
                              child: Text('Przekątna',style: TextStyle(fontSize: 22)),
                            ),
                          ),
                          onTap: (){
                            focus1.unfocus();
                            focus2.unfocus();
                            focus3.unfocus();
                            focus4.unfocus();
                            setState(() {
                              selectedJednostka5=_dropdownMenuItems[1].value;
                              double d = null;
                              if(whatWasWrote=='pole'){
                                pierwszaLinia="P=d<sup><small><small>2</small></small></sup>/2";
                                drugaLinia="d=&#8730;(2*P)";
                                trzeciaLinia="";
                                czwartaLinia="";
                                pole = 2*pole;
                                d = sqrt(pole);
                                d/=selectedJednostka5.mnoznik;
                                wynik=d.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='obwod'){
                                pierwszaLinia="Ob=4a";
                                drugaLinia="a=Ob/4";
                                trzeciaLinia="d=a&#8730;2";
                                czwartaLinia="";
                                double a = obwod/4;
                                d=a*sqrt(2);
                                d/=selectedJednostka5.mnoznik;
                                wynik=d.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='bok'){
                                pierwszaLinia="d=a&#8730;2";
                                drugaLinia='';
                                trzeciaLinia='';
                                czwartaLinia='';
                                d = bok*sqrt(2);
                                d/=selectedJednostka5.mnoznik;
                                wynik=d.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
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
                            focus1.unfocus();
                            focus2.unfocus();
                            focus3.unfocus();
                            focus4.unfocus();
                            setState(() {
                              selectedJednostka5=_dropdownMenuItems[1].value;
                              double ob = null;
                              if(whatWasWrote=='bok'){
                                pierwszaLinia="Ob=4a";
                                drugaLinia="";
                                trzeciaLinia="";
                                czwartaLinia="";
                                ob = 4*bok;
                                ob/=selectedJednostka5.mnoznik;
                                wynik = ob.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='pole'){
                                pierwszaLinia="P=a<sup><small><small>2</small></small></sup>";
                                drugaLinia="a=&#8730;P";
                                trzeciaLinia="Ob=4a";
                                double a = sqrt(pole);
                                czwartaLinia='';
                                ob=4*a;
                                ob/=selectedJednostka5.mnoznik;
                                wynik = ob.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='przekatna'){
                                pierwszaLinia="d=a&#8730;2";
                                drugaLinia="a=d/&#8730;2";
                                trzeciaLinia="Ob=4*a";
                                czwartaLinia='';
                                double a = przekatna/sqrt(2);
                                ob = 4*a;
                                ob/=selectedJednostka5.mnoznik;
                                wynik = ob.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
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
                            focus1.unfocus();
                            focus2.unfocus();
                            focus3.unfocus();
                            focus4.unfocus();
                            setState(() {
                              selectedJednostka5=_dropdownMenuItems2[1].value;
                              double poleD = null;
                              if(whatWasWrote=='bok'){
                                pierwszaLinia="P=a<sup><small><small>2</small></small></sup>";
                                drugaLinia='';
                                trzeciaLinia='';
                                czwartaLinia='';
                                poleD = bok*bok;
                                poleD/=selectedJednostka5.mnoznik;
                                wynik=poleD.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='obwod'){
                                pierwszaLinia="Ob=4a";
                                drugaLinia="a=Ob/4";
                                double a = obwod/4;
                                trzeciaLinia="P=a<sup><small><small>2</small></small></sup>";
                                czwartaLinia='';
                                poleD = a*a;
                                poleD/=selectedJednostka5.mnoznik;
                                wynik = poleD.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
                              }
                              else if(whatWasWrote=='przekatna') {
                                pierwszaLinia="P=d<sup><small><small>2</small></small></sup>/2";
                                drugaLinia='';
                                trzeciaLinia='';
                                czwartaLinia='';
                                poleD = przekatna * przekatna / 2;
                                poleD/=selectedJednostka5.mnoznik;
                                wynik=poleD.toStringAsFixed(11);
                                wynik=przytnijStr(wynik);
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

                /*SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(wynik,style: TextStyle(fontSize: 25),textAlign: TextAlign.center),
                    ),
                    SizedBox(width: 10),
                    wynik!=''?Container(
                      width: 80,
                      child:DropdownButton(
                        isExpanded: true,
                        value: selectedJednostka5,
                        items: whatIsClicked=='pole'?_dropdownMenuItems2:_dropdownMenuItems,
                        onChanged: onChangeDropdownItem5,
                      ),
                    ):SizedBox(),
                  ],
                ),*/
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
  Jednostka selectedJednostka1,selectedJednostka2,selectedJednostka3,selectedJednostka4,selectedJednostka5;
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
      print(it.name.toString());
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
      przekatna/=selectedJednostka4.mnoznik;
      selectedJednostka4 = selectedJednostkaPom;
      przekatna*=selectedJednostka4.mnoznik;
    });
  }
  void setDefaultJednostkas(){
    selectedJednostka1 = _dropdownMenuItems[1].value;
    selectedJednostka2 = _dropdownMenuItems[1].value;
    selectedJednostka3 = _dropdownMenuItems2[1].value;
    selectedJednostka4 = _dropdownMenuItems[1].value;
    selectedJednostka5 = _dropdownMenuItems[1].value;
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