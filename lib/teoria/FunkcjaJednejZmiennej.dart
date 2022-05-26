import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class FunkcjaJednejZmiennejTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Funkcja jednej zmiennej</h1>", r"""
    <p>Możemy powiedzieć, że w zbiorze X jest określona pewna funckja f(tj. funkcja jednej zmiennej), jeżeli dla każdej liczby
    x ze zbioru X jest przyporządkowana dokładnie jedna liczba y ze zbioru Y. Zapisujemy to:</p>
    <p>y=f(x), gdzie x - argument funkcji / zmienna niezależna, y - zmienna zależna.</p>
    <p>Dziedzina funkcji f - to zbiór X wartości argumentów funkcji f.</p>
    <p>Zakres funkcji f - to zbiór Y wartości funkcji f.</p>
    <p>Dla wyjaśnienia:</p>
    <p>Zakresem funkcji \(x^2-4\) jest zbiór liczb x z przedziału: \(-\infty&#60;x&#60;+\infty\).</p>
    <p>Zakresem funkcji \({\sqrt({16-x^2})}\) jest zbiór liczb x
    spełniających nierówność: -2&#8804;x&#8805;2.</p>

    <br/><br/>

    <h2>Funkcja złożona</h2>
    <p>Funkcja y=f(g(x)) jest przykładem funkcji złożonej.</p>
    <p>Jeżeli polem funkcji g(x) jest zbiór liczb A, a zakresem zbiór liczb B. Polem funkcji f(z) jest zbiór liczb C,
      a zakresem zbiór liczb D, i B jest zawarte w C to oba zbiory przyporzodkowują każdej liczbie x ze zbioru A dokładnie jedną liczbą D.</p>

    <br/><br/>

    <h2>Funkcja różnowartościowa</h2>
    <p>Jest to funkcja, w której nie ma dwóch takich liczb, dla których wartość funkcji wynosi tyle samo.</p>
			
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

class FunkcjaJednejZmiennej extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  FunkcjaJednejZmiennej(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text("Funkcja jednej zmiennej"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              FunkcjaJednejZmiennejTekst.rownanie,
            ]),
            style: TeXViewStyle(
              margin: TeXViewMargin.all(10),
              elevation: 10,
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
