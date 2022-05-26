import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Pochodne2Tekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Pochodne funkcji postaci y=f(x)</h1>", r"""
    <h3>Wzory rachunku różniczkowego</h3>
    <p>\(({x^a})'=ax^{a-1}\), gdzie x&#62;0, a&#8714;R.</p>
    <p>sin x'=cos x.</p>
    <p>cos x'=-sin x.</p>
    <p>tg x'=\({\frac {1} {cos^2x}}=1+tg^2x\), gdzie cosx&#8800;0.</p>
    <p>ctg x'=\({\frac {-1} {sin^2x}}\)=-(1+ctg^2x), gdzie sinx&#8800;0.</p>
    <p>(arcsin x)'=\({\frac {-1} {\sqrt{1-x^2}}}\), gdzie -1&#60;x&#60;1, 0&#8804;arcsin x &#8804;&frac12;&pi;.</p>
    <p>(arccos x)'=\({\frac {1} {\sqrt{1-x^2}}}\), gdzie -1&#60;x&#60;1, 0&#8804;arccos x &#8804;&pi;.</p>
    <p>(arctg x)'=\({\frac {1} {1+x^2}}\), gdzie -&frac12;&pi;&#8804;arctg x &#8804;&frac12;&pi;.</p>
    <p>(arcctg x)'=\({\frac {-1} {1+x^2}}\), gdzie 0&#8804;arcctg x &#8804;&pi;.</p>
    <p>\((e^x)'=e^x\).</p>
    <p>\((a^x)'=a^xln a\), gdzie a&#62;0.</p>
    <p>ln|x|'=\({\frac {1} {x}}\), gdzie x&#8800;0.</p>
    <br/><br/><br/>

    <h3>Kilka przykładów dla wyjaśnienia:</h3><br/>

    <p>1) &nbsp;\(y=2x^6+5x^4-12x^2-15\)</p>
    <p>y=\(2&#8901;6x^5+5&#8901;4x^3-12&#8901;2x-0 =12x^5+20x^3-24x\).</p>
    <br/><br/>
    <p>2) &nbsp;\(y={\frac {6x^3+6x} {\sqrt{2}}}\)</p>
    <p>\(y'={\frac {1} {\sqrt{2}}}{\cdot} (6x^3+6x)'={\frac {(18x^2+6){\cdot}{\sqrt{2}}} {{\sqrt{2}}{\cdot}{\sqrt{2}}}}=(9x^2+3){\cdot} {\sqrt{2}}\).</p>
    <br/><br/>

    <p>3) &nbsp;\(y={\frac {5x^5+6x^3+2x+1} {4x^3}}\)</p>
    <p>\(y={\frac {5} {4}}x^2+{\frac {6} {4}}+{\frac {1} {2}}x^{-2}+{\frac {1} {4}}x^{-3}\)</p>
    <p>\(y'={\frac {10} {4}}x+0+{\frac {-2} {2}}x^{-3}+{\frac {-3} {4}}x^{-4}\)</p>
    <p>\(y'=10x^5-4x-3\)</p>
    <br/><br/>

    <p>4)&nbsp;\(y={\frac {6x^2-5x^{7/3}} {3x^{{\frac {1} {2}}}}}\)</p>
    <p>\(y=2x^{\frac {3} {2}}-{\frac {5} {3}}x^{\frac {11} {6}}\)</p>
    <p>\(y'=3x^{\frac {1} {2}}-{\frac {55} {18}}x^{\frac {5} {6}}=3{\sqrt{2}}-55{\sqrt[6]{x^5}}\)</p>
    <br/><br/>

    <p>5)&nbsp;\(y=3x^4sinx\)</p>
    <p>\(y'=12x^3cosx\)</p>
    <br/><br/>

    <p>6)&nbsp;\(y={3x^4+4x^2-7x+1}^4\)</p>
    <h5>Funkcja jest funkcją złożoną, z tego powodu rozpiszemy ją na dwie funkcje y i z.</h5>
    <p>\(z=3x^4+4x^2-7x+1\)&nbsp;&nbsp;&nbsp;\(y=z^4\)</p>
    <p>\({\frac {dy} {dx}}={\frac {dy} {dz}} {\cdot} {\frac {dz} {dx}}\)</p>
    <p>\({\frac {dy} {dz}}=4z^3\)</p>
    <p>\({\frac {dz} {dx}}=12x^3+8x-7\)</p>
    <p>\({\frac {dy} {dx}}=4z^3(12x^3+8x-7)\)</p>
    <p>\({\frac {dy} {dx}}=4{(3x^4+4x^2-7x+1)}^3(12x^3+8x-7)\)</p>
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

class Pochodne2 extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  Pochodne2(
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
              Pochodne2Tekst.rownanie,
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
