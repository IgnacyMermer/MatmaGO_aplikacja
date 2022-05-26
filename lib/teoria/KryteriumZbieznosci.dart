import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class KryteriumZbieznosciTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Kryteria zbieżności i rozbieżności szeregów</h1>", r"""
    <br/><br/>
    <h3>Kryterium porównawcze.</h3>
    <p>Polega ono na porównywaniu szeregu z drugim szeregiem, którego zbieżność znamy. Jeśli wiemy, że badany szereg jest
    mniejszy od innego szeregu zbieżnego, to musi być on również zbieżny.</p>
    <br/>
    <p>\({\displaystyle\sum_{n=1}^\infty a_n}\)&nbsp;&nbsp;(A)</p>
    <p>\({\displaystyle\sum_{n=1}^\infty b_n}\)&nbsp;&nbsp;(B)</p>
    <p>Jeśli wiemy, że \(a_n&#8804;b_n\) to możemy wywnioskować:</p>
    <ul>
        <li>ze zbieżności szeregu B wynika zbieżność szeregu A</li>
        <li>z rozbieżności szeregu A wynika rozbieżność szeregu B</li>
    </ul>
    <br/><br/>

    <h3>Kryterium d'Alemberta</h3>

    <p>Mamy szereg \({\sum_{n=1}^\infty u_n}\)&nbsp;o wyrazach dodatnich. Jeżeli:</p>
    <p>\({\frac {u_{n+1}} {u_n}}\)&#60;1, to szereg jest zbieżny.</p>
    <p>\({\frac {u_{n+1}} {u_n}}\)&#8805;1, to szereg jest rozbieżny.</p>
    <br/><br/>

    <p>Dzięki twierdzeniu d'Alemberta możemy wywnioskować, że:</p>
    <p>\({\lim\limits_{n \rightarrow \infty} {\frac {u_{n+1}} {u_n}}}\)&#60;1, to szereg jest zbieżny.</p>
    <p>\({\lim\limits_{n \rightarrow \infty} {\frac {u_{n+1}} {u_n}}}\)&#62;1, to szereg jest rozbieżny.</p>
    <p>\({\lim\limits_{n \rightarrow \infty} {\frac {u_{n+1}} {u_n}}}\)=1, to szereg jest trudny do 
    określenia i jest konieczne użycie innej metody badania zbieżności szeregów.</p>

    <br/><br/>
    <h3>Kryterium Cauchy'ego</h3>
    <p>Głównymi wnioskami, które możemy wyciągnąć z podanych kryteriów Cauchy'ego:</p>
    <p>Jeżeli \({\lim\limits_{n \rightarrow \infty} {\sqrt[n]{u_n}}}\)&#60;1, to szereg jest zbieżny</p>
    <p>Jeżeli \({\lim\limits_{n \rightarrow \infty} {\sqrt[n]{u_n}}}\)&#62;1, to szereg jest rozbieżny</p>
    <p>Jeżeli \({\lim\limits_{n \rightarrow \infty} {\sqrt[n]{u_n}}}\)=1, to szereg jest niemożliwy do określenia tym kryterium.</p>
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

class KryteriumZbieznosci extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  KryteriumZbieznosci(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text("Kryteria zbieżności"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              KryteriumZbieznosciTekst.rownanie,
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
