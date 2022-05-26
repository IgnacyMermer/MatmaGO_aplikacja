import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Pochodne3Tekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Pochodne funkcji postaci y=f(x)</h1>", r"""
    <h2>Jeszcze kilka przykładów</h2>
    <p>7)&nbsp;y=cos3x</p>
    <p>y=cosz&nbsp;&nbsp;&nbsp;z=3x</p>
    <p>\({\frac {dy} {dz}}=cosz\)</p>
    <p>\({\frac {dz} {dx}}=3\)</p>
    <p>\({\frac {dy} {dx}}=3cos3x\)</p>
    <br/><br/>

    <p>8)&nbsp;\(y=sin^2x\)</p>
    <p>\(y=z^2&nbsp;&nbsp;&nbsp;z=sinx\)</p>
    <p>\({\frac {dy} {dz}}=2z\)</p>
    <p>\({\frac {dz} {dx}}=cosx\)</p>
    <p>\({\frac {dy} {dx}}=2sin^{2}xcosx\)</p>
    <br/>

    <p>9)&nbsp;\(y=e^{3x^3+2x}\)</p>
    <p>\(y=e^z&nbsp;&nbsp;&nbsp;z=3x^3+2x\)</p>
    <p>\({\frac {dy} {dz}}=e^z\)</p>
    <p>\({\frac {dz} {dx}}=9x^2+2\)</p>
    <p>\({\frac {dy} {dx}}=(9x^2+2)e^z=(9x^2+2)e^{3x^3+2x}\)</p>
    <br/>

    <h4>W powyższych przykładach \({\frac {dy} {dx}}\)&nbsp;
      możemy zamienić z y'</h4>

    <br/><br/><br/>

    <h2>Pochodne rzędów wyższych</h2>
    <p>Pochodną rzędu drugiego nazywamy pochodną pierwszej pochodnej funkcji, możemy również powiedzieć drugą pochodną funkcji
    y=f(x). Pochodna rzędu trzeciego nazywamy pochodną poprzedniej pochodnej funkcji f(x). Pochodną rzędu drugiego możemy
    zapisać następująco:</p>
    <p>y'', f''(x), \({\frac {d^2y} {dx^2}}\)</p>
    <p>Pochodne kolejnych rzędów możemy zapisywać (na przykładzie pochodnej rzędu szóstego):</p>
    <p>\(y^{(6)}, y^{VI}, f^{(6)}(x), f^{VI}(x), {\frac {d^6y} {dx^6}}\)</p>
    <br/>
    <h4>Przykład:</h4>
    <p>Wypisz 7 pochodnych wyższych rzędów funkcji:</p>
    <p>\(y=x^6+4x^5-3x^3-7x^2+8x\)</p>
    <p>\(y'=6x^5+20x^4-9x^2-14x+8\)</p>
    <p>\(y''=30x^4+80x^3-18x-14\)</p>
    <p>\(y^{3}=120x^3+240x^2-18\)</p>
    <p>\(y^{4}=360x^2+480x\)</p>
    <p>\(y^{5}=720x+480\)</p>
    <p>\(y^{6}=720\)</p>
    <p>\(y^{7}=0\)</p>
    <h4>Każda kolejna pochodna, czyli pochodna wyższego rzędu niż wielomian będzie równa zero.</h4>

			""");

  /*
    <br/><br/><br/>

    <h2>Pochodne funkcji określonej równaniami parametrycznymi</h2>
    <p>Mamy dwie funkcje:&nbsp; x=f(z),  y=g(z), (gdzie z, które jest parametrem, przybiera wartości z pewnego przedziału) to możemy powiedzieć, że
    te funkcje określają krzywą na płaszczyźnie. Powyższe równania zakreślają pewną krzywą, i są jej równaniami parametrycznymi.</p>
    <p>Równania parametryczne mogą przedstawiać te samą krzywą, znaczy to że punkt ruchomy może poruszać w różny sposób
    po tej samej krzywej.</p>
    <p>Jeśli, na przykład z będzie oznaczało czas, to równania będą równaniami ruchu punktu zakreślającego pewną krzywą.</p>
    <p>Krzywą możemy traktować jako wykres funkcji y=h(x), gdy każda prosta, która jest równoległa do osi OY
      ma z nią co najwyżej jeden punkt wspólny. Wtedy równania x=f(z) i y=g(z) określają również y jako funkcję zmiennej x.</p>


   */

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

class Pochodne3 extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  Pochodne3(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text("Pochodne"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              Pochodne3Tekst.rownanie,
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
