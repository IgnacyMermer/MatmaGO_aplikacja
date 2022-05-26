import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Pochodne1Tekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Pochodne funkcji postaci y=f(x)</h1>", r"""
    <h2>Pochodne rzędu pierwszego</h2>
    <p>Pochodna funkcji y=f(x) w punkcie x to granica, do której dąży stosunek przyrostu funkcji &#8710;y do odpowiedniego przyrostu zmiennej 
    niezależnej &#8710;x. Przyrost zmiennej niezależnej dąży do zera.</p>
    <p>\(\lim\limits_{&#8710;x \rightarrow 0} {\frac {&#8710;y} {&#8710;x}} = \lim\limits_{&#8710;x \rightarrow 0} {\frac {f(x+&#8710;x)-f(x)} {&#8710;x}}\)</p>
    <p>Jeżeli taka granica nie istnieje, to w tym punkcie funkcja nie ma również pochodnej.</p>
    <br/>

    <p>Pochodną funkcji f(x) możemy zapisać:</p>
    <p>y', f'(x), \({\frac {dy} {dx}}, {\frac {df(x)} {dx}}\).</p>
    <br/>

    <p>Pochodna funkcji y=f(x) w danym punkcie równa się współczynnikowi kątowemu stycznej do wykresu funkcji (wsp. kątowy prostej
      jest tangensem kąta a, który prosta tworzy z dodatnim zwrotem osi OX).</p>

    {/*rysunek*/}

    <br/><br/>
    <p>Wypiszmy również główne twierdzenie pochodnych:</p>
    <p>Jeśli funkcja ma w danym punkcie pochodną skończoną, jest funkcją różniczkowalną, to jest w tym punkcie ciągła.</p>
    <p>Lecz nie zawsze funkcja stała musi mieć pochodną (np. y=|x|)</p>
    <br/>

    <p>Pochodna funkcji stałej równa się zero (y'=0), jeżeli y=c.</p><br/>
    <p>Pochodna iloczynu stałej przez funkcje równa się iloczynowi stałej przez pochodną funkcji. Oznacza to, że jeśli</p>
    <p>y=c&#8901;f(x) &nbsp;to&nbsp; y'=c&#8901;f'(x).</p><br/>
    <p>Pochodna sumy funkcji, jeżeli &nbsp;y=f(x)+g(x) &nbsp;jest równa&nbsp; y'=f'(x)+g'(x).</p><br/>
    <p>Pochodna iloczynu funkcji, jeżeli &nbsp;\(y=f(x){\cdot}g(x)\) &nbsp;jest równa&nbsp; \(y'=f'(x){\cdot}g(x)+g'(x){\cdot}f(x)\).
    </p><br/>
    <p>Pochodna ilorazu funkcji, jeżeli &nbsp;\(y={\frac {f(x)} {g(x)}}, (g(x)&#8800;0)\) &nbsp;jest równa &nbsp;\(y'={\frac {f'(x){\cdot}g(x)-g'(x){\cdot}f(x)} {g(x)^2}}\).
    </p><br/>
    <p>Pochodna funkcji odwrotnej. Jeżeli &nbsp;y=f(x) &nbsp;ma funkcję odwrotną &nbsp;x=g(y)&nbsp; to pochodna funkcji odwrotnej równa się odwrotności pochodnej
      danej funkcji &nbsp;y=f(x).</p><br/>
    <p>\({\frac {dx} {dy}}={\frac {1} {\frac {dy} {dx} }}\)</p>
    <p>f(x) oraz g(x) są funkcjami różniczkowalnymi.</p>
    <br/>
    <p>Różniczką dy funkcji y=f(x) jest iloczyn pochodnej pochodnej tej funkcji przez przyrost dx zmiennej niezależnej.</p>
    <p>dy=f'(x)dx</p>
    <br/><br/>

    <p>Różniczka przedstawia główną część przyrostu funkcji.</p>

    <br/><br/>
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

class Pochodne1 extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  Pochodne1(
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
              Pochodne1Tekst.rownanie,
            ]),
            /*style: TeXViewStyle(
              margin: TeXViewMargin.all(5),
              textAlign: TeXViewTextAlign.Center,
              elevation: 30,
              fontStyle: TeXViewFontStyle(fontSize: 18),
              borderRadius: TeXViewBorderRadius.all(10),
              border: TeXViewBorder.all(
                TeXViewBorderDecoration(
                    borderColor: Colors.blueGrey[900],
                    borderStyle: TeXViewBorderStyle.Solid,
                    borderWidth: 3),
              ),
              backgroundColor: Colors.blueGrey[500],
            ),*/
            style: TeXViewStyle(
              margin: TeXViewMargin.all(10),
              textAlign: TeXViewTextAlign.Center,
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
