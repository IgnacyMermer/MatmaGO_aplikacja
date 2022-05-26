import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class SzeregiPrzemienneTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Szeregi przemienne</h1>", r"""
    <p>Wcześniej mogliśmy grupować i zmieniać kolejność wyrazów szeregu. Jednak teraz przy szeregach przemiennych,
      gdy wyrazy na przemian są różnego znaku, nie możemy tego czynić przy określaniu sumy, granicy lub zbieżności.
    </p>
    <h3>Kryterium Leibniza</h3>
    <p>Jeżeli od pewnego wyrazu szeregu przemiennego \({\displaystyle\sum_{n=1}^{\infty} {u_n}}\) wartości
        bezwzględne dażą do zera to ciąg jest zbieżny.</p>
    <p>Możemy z tego wywnioskować, że:</p>
    <p>\({|u_{n+1}|&#8804;|{u_n}|}\)</p>
    <p>\({\lim\limits_{n \rightarrow \infty} u_n} = 0\)</p>=
    <br/><br/>

    <h3>Kryterium bezwzględnej zbieżności szeregów</h3>
    <p>Jeżeli szereg \({\displaystyle\sum_{n=1}^{\infty} |{u_n}|}\) jest zbieżny to również szereg
        \({\displaystyle\sum_{n=1}^{\infty} {u_n}}\) jest zbieżny. Jedyny warunkiem jest to, że wartości bezwględne
        drugiego szeregu muszą być równe wartościom pierwszego szeregu.</p>
    <br/><br/>
    <p>Przykład:</p>
    <p>\({\displaystyle\sum_{n=1}^{\infty} {u_n} {\frac {{-1}^{n+1}} {n^3}}}\)</p>
    <p>Szereg ten jest zbieżny, ponieważ szereg \({\displaystyle\sum_{n=1}^{\infty} {u_n} {\frac 1 {n^3}}}\) jest zbieżny.</p>
			
			
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

class SzeregiPrzemienne extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  SzeregiPrzemienne(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text("Szeregi przemienne"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              SzeregiPrzemienneTekst.rownanie,
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
