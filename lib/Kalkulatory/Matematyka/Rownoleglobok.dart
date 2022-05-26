import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart';
import 'dart:math';
class Rownoleglobok extends StatefulWidget {
  final Function comeBack;
  Rownoleglobok({this.comeBack});
  @override
  _RownoleglobokState createState() => _RownoleglobokState();
}
class _RownoleglobokState extends State<Rownoleglobok> {
  double bokA=-1,bokB=-1, przekatnaA=-1, przekatnaB=-1, pole=-1, obwod=-1,katA=-1,katB=-1,katC=-1,wysokoscA=-1,wysokoscB=-1;
  String pierwszaLinia='', drugaLinia='', trzeciaLinia='', czwartaLinia='',wynik='';
  String whatWasWrote='';
  TextEditingController controllerPole = TextEditingController(),controllerObwod = TextEditingController();
  TextEditingController controllerBokA = TextEditingController(),controllerPrzekatnaA = TextEditingController();
  TextEditingController controllerPrzekatnaB = TextEditingController(),controllerWysokoscA=TextEditingController();
  TextEditingController controllerKatA = TextEditingController(),controllerKatB = TextEditingController();
  TextEditingController controllerBokB = TextEditingController(),controllerWysokoscB=TextEditingController();
  TextEditingController controllerKatC=TextEditingController();
  FocusNode focus1,focus2,focus3,focus4,focus5,focus6,focus7,focus8,focus9,focus10,focus11;
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
    focus11=new FocusNode();
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
    focus11.dispose();
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
                              controllerPrzekatnaA=new TextEditingController();
                              controllerPrzekatnaB=new TextEditingController();
                              controllerKatA=new TextEditingController();
                              controllerKatB=new TextEditingController();
                              controllerWysokoscA=new TextEditingController();
                              controllerWysokoscB=new TextEditingController();
                              controllerKatC=new TextEditingController();
                              bokA=-1;
                              bokB=-1;
                              obwod=-1;
                              pole=-1;
                              przekatnaA=-1;
                              przekatnaB=-1;
                              katA=-1;
                              katB=-1;
                              katC=-1;
                              wysokoscA=-1;
                              wysokoscB=-1;
                              pierwszaLinia='';
                              drugaLinia='';
                              trzeciaLinia='';
                              czwartaLinia='';
                              wynik='';
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
                              focus11.unfocus();
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
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                    focus9.unfocus();
                                    focus10.unfocus();
                                    focus11.unfocus();
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
                                    focus6.unfocus();
                                    focus7.unfocus();
                                    focus8.unfocus();
                                    focus9.unfocus();
                                    focus10.unfocus();
                                    focus11.unfocus();
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
                                    focus9.unfocus();
                                    focus10.unfocus();
                                    focus11.unfocus();
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
                                    focus9.unfocus();
                                    focus10.unfocus();
                                    focus11.unfocus();
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
                                    focus11.unfocus();
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
                                  value: selectedJednostka6,
                                  items: _dropdownMenuItems2,
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
                                    focus9.unfocus();
                                    focus10.unfocus();
                                    focus11.unfocus();
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
                                      controller: controllerWysokoscA,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Krótsza wysokość',
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
                                        wysokoscA*=selectedJednostka7.mnoznik;
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
                                  value: selectedJednostka7,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem7,
                                  onTap: (){
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
                                    focus11.unfocus();
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
                                      controller: controllerWysokoscB,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Dłuższa wysokość',
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
                                        wysokoscB*=selectedJednostka8.mnoznik;
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
                                  value: selectedJednostka8,
                                  items: _dropdownMenuItems,
                                  onChanged: onChangeDropdownItem8,
                                  onTap: (){
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
                                    focus11.unfocus();
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
                                      focusNode: focus10,
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
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child:Container(
                                    child:TextFormField(
                                      focusNode: focus11,
                                      controller: controllerKatC,
                                      style: TextStyle(fontSize: 22,color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Mn. kąt między przekątn.',
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
                            focus11.unfocus();
                            setState(() {
                              double a,b,d,ob,p,kat,sinus,cosinus,tanges,h1,h2,d1,d2,kat1,kat2;
                              if(controllerBokA.text!=''&&controllerWysokoscB.text!=''){
                                p=bokA*wysokoscB;
                                p/=selectedJednostka6.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerBokB.text!=''&&controllerWysokoscA.text!=''){
                                p=bokB*wysokoscA;
                                p/=selectedJednostka6.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerBokA.text!=''&&controllerBokB.text!=''&&controllerKatA.text!=''){
                                kat=katA>=180?180-katA:katA;
                                kat=kat*pi/180;
                                sinus = sin(kat);
                                p=bokA*bokB*sinus;
                                p/=selectedJednostka6.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerBokA.text!=''&&controllerBokB.text!=''&&controllerKatB.text!=''){
                                kat=katB>=180?180-katB:katB;
                                kat=kat*pi/180;
                                sinus = sin(kat);
                                p=bokA*bokB*sinus;
                                p/=selectedJednostka6.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerPrzekatnaA.text!=''&&controllerPrzekatnaB.text!=''&&controllerKatC.text!=''){
                                kat=katC>=180?180-katC:katC;
                                kat=kat*pi/180;
                                sinus = sin(kat);
                                p = przekatnaA*przekatnaB*sinus/2;

                                p/=selectedJednostka6.mnoznik;
                                String x=p.toStringAsFixed(11);
                                controllerPole.text=przytnijStr(x);
                              }
                              else if(controllerObwod.text!=''&&controllerBokB.text!=''){
                                a=(obwod-2*bokB)/2;

                                a/=selectedJednostka1.mnoznik;
                                String x=a.toStringAsFixed(11);
                                controllerBokA.text=przytnijStr(x);
                              }
                              else if(controllerObwod.text!=''&&controllerBokA.text!=''){
                                b=(obwod-2*bokA)/2;

                                b/=selectedJednostka2.mnoznik;
                                String x=b.toStringAsFixed(11);
                                controllerBokB.text=przytnijStr(x);
                              }
                              else if(controllerPole.text!=''&&controllerWysokoscB.text!=''){
                                a=pole/wysokoscB;
                                a/=selectedJednostka1.mnoznik;
                                String x = a.toStringAsFixed(11);
                                controllerBokA.text=przytnijStr(x);
                              }
                              else if(controllerPole.text!=''&&controllerWysokoscA.text!=''){
                                b=pole/wysokoscA;
                                b/=selectedJednostka2.mnoznik;
                                String x = b.toStringAsFixed(11);
                                controllerBokB.text=przytnijStr(x);
                              }
                              else if(controllerPole.text!=''&&controllerBokA.text!=''){
                                h2=pole/bokA;
                                h2/=selectedJednostka8.mnoznik;
                                String x=h2.toStringAsFixed(11);
                                controllerWysokoscB.text=przytnijStr(x);
                              }
                              else if(controllerPole.text!=''&&controllerBokB.text!=''){
                                h1=pole/bokA;
                                h1/=selectedJednostka7.mnoznik;
                                String x=h1.toStringAsFixed(11);
                                controllerWysokoscA.text=przytnijStr(x);
                              }
                              else if(controllerBokA.text!=''&&controllerBokB.text!=''){
                                ob=2*bokA+2*bokB;

                                ob/=selectedJednostka5.mnoznik;
                                String x = ob.toStringAsFixed(11);
                                controllerObwod.text=przytnijStr(x);
                              }
                              else if(controllerWysokoscA.text!=''&&controllerBokA.text!=''){
                                cosinus = wysokoscA/bokA;
                                kat=acos(cosinus);
                                kat=kat/pi*180;
                                kat1=90-kat;
                                kat2=kat+90;
                                String x=kat1.toStringAsFixed(11);
                                String x2=kat2.toStringAsFixed(11);
                                controllerKatA.text=przytnijStr(x);
                                controllerKatB.text=przytnijStr(x2);
                              }
                              else if(controllerWysokoscB.text!=''&&controllerBokB.text!=''){
                                sinus = wysokoscB/bokB;
                                kat=asin(sinus);
                                kat=kat/pi*180;
                                kat1=kat;
                                kat2=180-kat;
                                String x=kat1.toStringAsFixed(11);
                                String x2=kat2.toStringAsFixed(11);
                                controllerKatA.text=przytnijStr(x);
                                controllerKatB.text=przytnijStr(x2);
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
                                focus9.unfocus();
                                focus10.unfocus();
                                focus11.unfocus();
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
                                focus9.unfocus();
                                focus10.unfocus();
                                focus11.unfocus();
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
                                focus9.unfocus();
                                focus10.unfocus();
                                focus11.unfocus();
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
                                focus11.unfocus();
                                setState(() {

                                  /*else{
                                    pierwszaLinia='';
                                    drugaLinia='';
                                    trzeciaLinia='';
                                    czwartaLinia='';
                                  }*/
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
                                focus9.unfocus();
                                focus10.unfocus();
                                focus11.unfocus();
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
  Jednostka selectedJednostka1,selectedJednostka2,selectedJednostka3,selectedJednostka4,selectedJednostka5,selectedJednostka6,selectedJednostka7,selectedJednostka8,selectedJednostka9;
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
      przekatnaA/=selectedJednostka3.mnoznik;
      selectedJednostka3 = selectedJednostkaPom;
      przekatnaA*=selectedJednostka3.mnoznik;
    });
  }
  onChangeDropdownItem4(Jednostka selectedJednostkaPom) {
    setState(() {
      przekatnaB/=selectedJednostka4.mnoznik;
      selectedJednostka4 = selectedJednostkaPom;
      przekatnaB*=selectedJednostka4.mnoznik;
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
      wysokoscA/=selectedJednostka7.mnoznik;
      selectedJednostka7 = selectedJednostkaPom;
      wysokoscA*=selectedJednostka7.mnoznik;
    });
  }
  onChangeDropdownItem8(Jednostka selectedJednostkaPom) {
    setState(() {
      wysokoscB/=selectedJednostka8.mnoznik;
      selectedJednostka8 = selectedJednostkaPom;
      wysokoscB*=selectedJednostka8.mnoznik;
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
    selectedJednostka8 = _dropdownMenuItems[1].value;
    selectedJednostka9 = _dropdownMenuItems[1].value;
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
