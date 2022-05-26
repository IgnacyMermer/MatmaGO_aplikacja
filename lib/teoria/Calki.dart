import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class CalkiTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Całki</h1>", r"""
    <p>Całkowanie to działanie odwrotne do różniczkowania.</p>
			Całką funkcji \(f(x)\) możemy nazwać funkcję \(F(x)\), taką że:
			\(F'(x)=f(x)\)</br>
			Jeśli powyższy warunek jest spełniony to funkcja F(x) jest funkcją pierwotną.</br></br>
			Całkowanie zapisujemy:</br>
			\(\int{f(x)dx}=F(x)\)</br>
			<h5>dx oznacza, że całkujemy funkcję f(x) po zmiennej x.</h5>
			<br/><br/>
			Przykład:</br>
			1)&nbsp;&nbsp;\(\int{f(x)dx}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f(x)=6x+20\)</br>
			\(\int 6x+20&nbsp;dx=3x^2+20x+z\), gdzie z - dow. liczba rzeczywista.</br></br>
			
			2)&nbsp;&nbsp;\(\int{f(x)dx}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f(x)=x^7\)</br>
			\(\int x^7&nbsp;dx={1\over8}x^8+z\), gdzie z - dow. liczba rzeczywista.
			</br></br></br></br>
			<h3>Podstawowe wzory rachunku całkowego:</h3>""");

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

class Calki extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  Calki(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text("Całki"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              CalkiTekst.rownanie,
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
