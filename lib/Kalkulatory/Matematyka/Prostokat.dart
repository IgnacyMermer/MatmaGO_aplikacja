import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:math';
import 'package:flutter_html/style.dart';
class Prostokat extends StatefulWidget {
  Function comeBack;
  Prostokat({this.comeBack});
  @override
  _ProstokatState createState() => _ProstokatState();
}
class _ProstokatState extends State<Prostokat> {
  double bokA=-1,bokB=-1, przekatna=-1, pole=-1, obwod=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerBokA = TextEditingController(),controllerPrzekatna = TextEditingController();
  TextEditingController controllerBokB = TextEditingController();
  FocusNode focus1,focus2,focus3,focus4,focus5;
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
                              controllerBokA=new TextEditingController();
                              controllerBokB=new TextEditingController();
                              controllerObwod=new TextEditingController();
                              controllerPole=new TextEditingController();
                              controllerPrzekatna=new TextEditingController();
                              bokA=-1;
                              bokB=-1;
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
                                  //width:260,
                                    child:TextFormField(
                                      focusNode: focus1,
                                      controller: controllerBokA,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Krótszy bok',
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
                                        bokA*=selectedJednostka1.mnoznik;
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
                                  value: selectedJednostka1,
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
                                      controller: controllerBokB,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Dłuższy bok',
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
                                        bokB*=selectedJednostka2.mnoznik;
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
                                  value: selectedJednostka2,
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
                              Container(
                                width: 80,
                                child:DropdownButton(
                                  isExpanded: true,
                                  value: selectedJednostka4,
                                  items: _dropdownMenuItems2,
                                  onChanged: onChangeDropdownItem4,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
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
                                        przekatna*=selectedJednostka5.mnoznik;
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
                                  value: selectedJednostka5,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem5,
                                  onTap: (){
                                    focus1.unfocus();
                                    focus2.unfocus();
                                    focus3.unfocus();
                                    focus4.unfocus();
                                    focus5.unfocus();
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
                            focus5.unfocus();
                            setState(() {
                              double a1,a2,d,ob,p;
                              if(controllerPole.text!=''&&(controllerBokB.text!=''||controllerBokA.text!='')&&(controllerPrzekatna.text==''||controllerObwod.text=='')){
                                whatWasWrote='pole';
                                a1=controllerBokA.text!=''?bokA:bokB;
                                a2 = pole/a1;
                                d=sqrt((a1*a1)+(a2*a2));
                                ob=2*a1+2*a2;
                                a2/=controllerBokA.text!=''?selectedJednostka2.mnoznik:selectedJednostka1.mnoznik;
                                ob/=selectedJednostka3.mnoznik;
                                d/=selectedJednostka5.mnoznik;
                                String pom = a2.toStringAsFixed(11);
                                String pom2=d.toStringAsFixed(11);
                                String pom3 = ob.toStringAsFixed(11);
                                controllerBokA.text!=''?controllerBokB.text=przytnijStr(pom):controllerBokA.text=przytnijStr(pom);
                                controllerPrzekatna.text=przytnijStr(pom2);
                                controllerObwod.text=przytnijStr(pom3);
                              }
                              else if(controllerObwod.text!=''&&(controllerBokB.text!=''||controllerBokA.text!='')&&(controllerPrzekatna.text==''||controllerPole.text=='')){
                                whatWasWrote='obwod';
                                a1=controllerBokA.text!=''?bokA:bokB;
                                a2 = obwod-(2*a1);
                                a2/=2;
                                p=a1*a2;
                                d=sqrt((a1*a1)+(a2*a2));
                                a2/=controllerBokA.text!=''?selectedJednostka2.mnoznik:selectedJednostka1.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                d/=selectedJednostka5.mnoznik;
                                String pom = a2.toStringAsFixed(11);
                                String pom2=d.toStringAsFixed(11);
                                String pom3 = p.toStringAsFixed(11);
                                controllerBokA.text!=''?controllerBokB.text=przytnijStr(pom):controllerBokA.text=przytnijStr(pom);
                                controllerPrzekatna.text=przytnijStr(pom2);
                                controllerPole.text=przytnijStr(pom3);
                              }
                              else if(controllerPrzekatna.text!=''&&(controllerBokB.text!=''||controllerBokA.text!='')&&(controllerPole.text==''||controllerObwod.text=='')){
                                whatWasWrote='przekatna';
                                a1=controllerBokA.text!=''?bokA:bokB;
                                a2=sqrt((przekatna*przekatna)-(a1*a1));
                                p=a1*a2;
                                ob=2*a1+2*a2;
                                a2/=controllerBokA.text!=''?selectedJednostka2.mnoznik:selectedJednostka1.mnoznik;
                                ob/=selectedJednostka3.mnoznik;
                                p/=selectedJednostka4.mnoznik;
                                String pom = a2.toStringAsFixed(11);
                                String pom2 = p.toStringAsFixed(11);
                                String pom3 = ob.toStringAsFixed(11);
                                controllerBokA.text!=''?controllerBokB.text=przytnijStr(pom):controllerBokA.text=przytnijStr(pom);
                                controllerPole.text=przytnijStr(pom2);
                                controllerObwod.text=przytnijStr(pom3);
                              }
                              else if(controllerBokA.text!=''&&controllerBokB.text!=''&&(controllerPole.text==''||controllerPrzekatna.text==''||controllerObwod.text=='')){
                                whatWasWrote='bok';
                                d=sqrt((bokA*bokA)+(bokB*bokB));
                                p=bokA*bokB;
                                ob=2*bokA+2*bokB;
                                p/=selectedJednostka4.mnoznik;
                                ob/=selectedJednostka3.mnoznik;
                                d/=selectedJednostka5.mnoznik;
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
                                  child: Text('Boki',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                focus1.unfocus();
                                focus2.unfocus();
                                focus3.unfocus();
                                focus4.unfocus();
                                focus5.unfocus();
                                setState(() {
                                  selectedJednostka5=_dropdownMenuItems[1].value;
                                  if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a*b";
                                    drugaLinia="b=P/a";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia="Ob=2a+2b";
                                    drugaLinia="2b=Ob-2a";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatna'){
                                    pierwszaLinia="d<sup><small><small>2</small></small></sup>=a<sup><small><small>2</small></small></sup>+b<sup><small><small>2</small></small></sup>";
                                    drugaLinia="b<sup><small><small>2</small></small></sup>=d<sup><small><small>2</small></small></sup>-a<sup><small><small>2</small></small></sup>";
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
                                  child: Text('Przekątna',style: TextStyle(fontSize: 22)),
                                ),
                              ),
                              onTap: (){
                                focus1.unfocus();
                                focus2.unfocus();
                                focus3.unfocus();
                                focus4.unfocus();
                                focus5.unfocus();
                                setState(() {
                                  selectedJednostka5=_dropdownMenuItems[1].value;
                                  if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a*b";
                                    drugaLinia="b=P/a";
                                    trzeciaLinia="d<sup><small><small>2</small></small></sup>=a<sup><small><small>2</small></small></sup>+b<sup><small><small>2</small></small></sup>";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='obwod'){
                                    pierwszaLinia="Ob=2a+2b";
                                    drugaLinia="d<sup><small><small>2</small></small></sup>=a<sup><small><small>2</small></small></sup>+b<sup><small><small>2</small></small></sup>";
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bok'){
                                    pierwszaLinia="d<sup><small><small>2</small></small></sup>=a<sup><small><small>2</small></small></sup>+b<sup><small><small>2</small></small></sup>";
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
                                setState(() {
                                  selectedJednostka5=_dropdownMenuItems[1].value;
                                  if(whatWasWrote=='pole'){
                                    pierwszaLinia="P=a*b";
                                    drugaLinia="b=P/a";
                                    trzeciaLinia="Ob=2a+2b";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatna'){
                                    pierwszaLinia="d<sup><small><small>2</small></small></sup>=a<sup><small><small>2</small></small></sup>+b<sup><small><small>2</small></small></sup>";
                                    drugaLinia="b=&#8730;(d<sup><small><small>2</small></small></sup>-a<sup><small><small>2</small></small></sup>)";
                                    trzeciaLinia="Ob=2a+2b";
                                    czwartaLinia="";
                                  }
                                  else if(whatWasWrote=='bok'){
                                    pierwszaLinia='Ob=2a+2b';
                                    drugaLinia="";
                                    trzeciaLinia="";
                                    czwartaLinia="";
                                    wynik="";
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
                                setState(() {
                                  if(whatWasWrote=='obwod'){
                                    pierwszaLinia="Ob=2a+2b";
                                    drugaLinia="2b=Ob-2a";
                                    trzeciaLinia="P=a*b";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='przekatna') {
                                    pierwszaLinia="d<sup><small><small><2</small></small></sup>=a<sup><small><small><2</small></small></sup>+b<sup><small><small><2</small></small></sup>";
                                    drugaLinia="b=&#8730;(d<sup><small><small>2</small></small></sup>-a<sup><small><small>2</small></small></sup>)";
                                    trzeciaLinia="P=a*b";
                                    czwartaLinia='';
                                  }
                                  else if(whatWasWrote=='bok'){
                                    pierwszaLinia="P=a*b";
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
      bokA/=selectedJednostka1.mnoznik;
      selectedJednostka1 = selectedJednostkaPom;
      bokA*=selectedJednostka1.mnoznik;
    });
  }
  onChangeDropdownItem2(Jednostka selectedJednostkaPom) {
    setState(() {
      bokB/=selectedJednostka2.mnoznik;
      selectedJednostka2 = selectedJednostkaPom;
      bokB*=selectedJednostka2.mnoznik;
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
      przekatna/=selectedJednostka5.mnoznik;
      selectedJednostka5 = selectedJednostkaPom;
      przekatna*=selectedJednostka5.mnoznik;
    });
  }
  void setDefaultJednostkas(){
    selectedJednostka1 = _dropdownMenuItems[1].value;
    selectedJednostka2 = _dropdownMenuItems[1].value;
    selectedJednostka3 = _dropdownMenuItems[1].value;
    selectedJednostka4 = _dropdownMenuItems2[1].value;
    selectedJednostka5 = _dropdownMenuItems[1].value;
    selectedJednostka6 = _dropdownMenuItems[1].value;
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