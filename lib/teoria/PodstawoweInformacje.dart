import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class PodstawoweInformacjeTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Wprowadzenie</h1>", r"""
    <h2>Zbiory i ich oznaczanie</h2>
    <p>Jeżeli chcemy napisać, że element a nalęży do zbioru A stosujemy zapis:</p>
    <p>a &#8712; A,</p>
    <p>Jeżeli jednak a nie należy to oznaczamy to:</p>
    <p>a &#8713; A.</p>

    <br/>

    <p>Zapis</p>
    <p>A &#8834; B lub B &#8835; A</p>
    <p>oznacza, że zbiór A jest zawarty w zbiorze B, tzn. każdy element zbioru A jest elementem zbioru B, czyli
    A jest podzbiorem B lub B jest nadzbiorem A.</p></br>
    <h2>Jeśli wprowadzimy oznaczenia zbiorów:</h2>
    <p>P - zbiór liczb parzystych dodatnich</p>
    <p>Q - zbiór liczb nieparzystych dodatnich</p>
    <p>to możemy wprowadzić zapis:</p>
    <p>x &#8712; X : S(x), gdzie S(x) jest to funkcja zdaniowa</p>
    <p>i dla przykładu zapis:</p>
    <p>x &#8712; P : 1&#60;x&#60;8</p>
    <p>oznacza liczby: 2, 4, 6,</p><br/>
    <p>x &#8712; Q : x<sup>2</sup>&#60;16,</p>
    <p>oznacza liczby: 1,3.</p>

    <br/><br/><br/>
    <h1>Logika w zbiorach</h1>
			
			
    <p>x &#8712; A &#8746; B, inaczej: x &#8712; A &#8744; x &#8712; B</p>
    <br/>
    
    <p>x &#8712; A &#8745; B, inaczej: x &#8712; A &#8743; x &#8712; B</p>
    <br/>
    
    
    <p>x &#8712; A \ B, inaczej: x &#8712; A &#8743; x &#8713; B</p>
			
			""");

  static TeXViewWidget _teXViewWidget(String title, String body) {
    return TeXViewColumn(
        style: TeXViewStyle(
            margin: TeXViewMargin.all(0),
            padding: TeXViewPadding.all(10),
            borderRadius: TeXViewBorderRadius.all(5),
            border: TeXViewBorder.all(TeXViewBorderDecoration(
                borderWidth: 1,
                borderStyle: TeXViewBorderStyle.Initial,
                borderColor: Colors.blueGrey[800]))),
        children: [
          TeXViewDocument(title,
              style: TeXViewStyle(
                  padding: TeXViewPadding.all(8),
                  borderRadius: TeXViewBorderRadius.all(5),
                  textAlign: TeXViewTextAlign.Center,
                  width: 250,
                  margin: TeXViewMargin.zeroAuto(),
                  backgroundColor: Colors.blueGrey[800])),
          TeXViewDocument(body,
            style: TeXViewStyle(margin: TeXViewMargin.only(top: 10), sizeUnit: TeXViewSizeUnit.Percent),)
        ]);
  }
}

class PodstawoweInformacje extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  PodstawoweInformacje(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Podstawowe informacje"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              PodstawoweInformacjeTekst.rownanie,
            ]),
            style: TeXViewStyle(
              margin: TeXViewMargin.all(10),
              elevation: 10,
              textAlign: TeXViewTextAlign.Center,
              borderRadius: TeXViewBorderRadius.all(25),
              border: TeXViewBorder.all(
                TeXViewBorderDecoration(
                    borderColor: Colors.blueGrey[900],
                    borderStyle: TeXViewBorderStyle.Solid,
                    borderWidth: 5),
              ),
              backgroundColor: Colors.blueGrey[500],
            ),
          ),
        ],
      ),
    );
  }
}
