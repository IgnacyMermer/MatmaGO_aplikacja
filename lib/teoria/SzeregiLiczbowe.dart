import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class SzeregiLiczboweTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Nieskończony szereg liczbowe</h1>", r"""
			<p>Oznaczamy go symbolem: \({\displaystyle\sum_{n=1}^\infty {\begin{pmatrix}
   1 \\
   . 
\end{pmatrix}}}\) lub \(u_1+u_2+...+u_n+...\)</p>
      <br/><br/>
      <p>Suma szeregu: \(s_n=u_1+u_2+...+u_n\), gdzie \(u_1, u_2, ...\) - to wyrazy szeregu, a \(u_n\) - to wyraz ogólny szeregu.</p>
      <br/><br/>
      <p>Jeżeli ciąg sum cząstkowych jest zbieżny, tzn. ma skończoną granicę s, to mówimy, że szereg jest zbieżny, a sumą
          szeregu nieskończonego jest liczba s. Oznaczamy to:</p>
      <p>\({\displaystyle\sum_{n=1}^\infty {\frac {(n+1)} {n^a}}}\)</p>
      <p>Jeżeli szereg nie jest zbieżny, to mówimy, że jest to szereg rozbieżny.</p>
      <br/>
      <p>Głównym i koniecznym warunkiem zbieżności każdego szeregu</p>
      <p>\({\displaystyle\sum_{n=1}^\infty u_n}\)</p>
      <p>jest to, żeby wyraz ogólny szeregu dążył do zera, czyli</p>
      <p>\({\lim\limits_{n \rightarrow \infty} u_n}\) = 0.</p>
      <br/><br/>

      <h2>Typy szeregów:</h2>
      <h3>Szereg geometryczny</h3>
      <p>\({\displaystyle\sum_{n=1}^\infty aq^{(n-1)}}\)</p>
      <p>lub</p>
      <p>\({a+aq+aq^2+...+aq^{(n-1)}}\)</p>
      
      <br/><br/>
      
      <h3>Szereg harmoniczny</h3>
      <p>\({\displaystyle\sum_{n=1}^\infty {\frac {n+1} {n^a}}}\)</p>
      <br/><br/>
      <p>Jeżeli a&#8804;1 to szereg jest rozbieżny, jeżeli a&#62;1 to szereg jest zbieżny.</p>
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

class SzeregiLiczbowe extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  SzeregiLiczbowe(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Szeregi liczbowe"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              SzeregiLiczboweTekst.rownanie,
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
