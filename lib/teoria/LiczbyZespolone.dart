import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LiczbyZespoloneTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Liczby zespolone</h1>", r"""
    <p>Liczby zespolone są rozszerzeniem liczb rzeczywistych.</p>
    <br/>
    <p>Główną różnicą między liczbami rzeczywistami, a zespolonymi jest to, że u liczb zespolonych można wyciągnąć pierwiastek
    z liczb ujemnych, kiedy u liczb rzeczywistych jest to niemożliwe. Taki pierwiastek jest liczbą tzw. liczbą urojoną,
    i zapisujemy go za pomocą jednostki urojonej i, którą definiujemy: </p>
    <p>\(i^2=-1\).</p>
    <p>Przykład:</p>
    <p>\(x^2=-36\)</p>
    <p>x=-6i &#8744; x=6i</p>
    <p>\((-6i)^2=36i^2=-36\)</p>
    <p>\((6i)^2=36i^2=-36\)</p>
    <br/><br/>

    <p>Liczby zespolone możemy zapisać jako sumę: z=x+iy lub jako uporządkowaną parę (x,y), (x, y - liczby rzeczywiste).</p>
    <p>Część rzeczywistą liczby zespolonej z oznaczamy symbolem &nbsp;Re(z)&nbsp;, a część urojoną oznaczamy &nbsp;Im(z).</p>

    <p>Przykład:</p>
    <p>1)&nbsp;Re(5+25i)=5</p>
    <p>Im(5+25i)=25</p>
    <p>2)&nbsp;\(Re(2+\sqrt{7})=2+\sqrt{7}\)</p>
    <p>\(Im(2+{\sqrt{7}})=0\)</p>
    <p>3)&nbsp;Re(10i)=0</p>
    <p>Im(10i)=10</p>


    <h4>Jeśli chodzi o dodawanie, odejmowanie, mnożenie i dzielenie, to stosujemy te same reguły, jak dla liczb rzeczywistych,
      z wyjątkiem iloczynu \(i^2=-1\)</h4>
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

class LiczbyZespolone extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  LiczbyZespolone(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Liczby zespolone"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              LiczbyZespoloneTekst.rownanie,
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
