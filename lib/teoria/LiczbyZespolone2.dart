import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LiczbyZespolone2Tekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Liczby zespolone</h1>", r"""
    <p>Przykład:</p>
    <p>1)&nbsp;(6+8i)+(3-2i)=9+6i</p>
    <p>2)&nbsp;\((6+8i)\cdot(3-2i)=-16i^2+12i+18=2+12i\)</p>
    <p>3)&nbsp;\({i^15}={{(i^2)}^7}{\cdot}i={{(-1)}^7}{\cdot}i=-i\)</p>
    <p>4)&nbsp;\({i^28}={{(i^2)}^14}={{(-1)}^14}=1\)</p>
    <p>5)&nbsp;\({(i^2+i^3+i^4)}^11={(-1-i+1)}^11=-i\)</p>
    <br/><br/><br/>
    <h2>Liczby sprzężone</h2>
    <p>Liczbą sprzężoną nazywamy liczbę zespoloną różniącą się od liczby z=a+bi tylko znakiem współczynnika przy i, i oznaczamy ją \(\bar{z}=a-bi\)
    </p>
    <p>Przykład:</p>
    <p>1)&nbsp;\(z=12+7i&nbsp;=>&nbsp;\bar{z}=12-7i\)</p>
    <p>2)&nbsp;\(z={\sqrt{7}}+9i&nbsp;=>&nbsp;\bar{z}=\sqrt{7}-9i\)</p>
    <br/><br/>
    <h3>Własności liczb sprzężonych:</h3>
    <p>1) &nbsp;\(z+\bar{z}=2Re(z)\)</p>
    <p>2) &nbsp;\(\bar{{z_1}+{z_2}}=\bar{z_1}+\bar{z_2}\)</p>
    <p>3) &nbsp;\(z{\cdot}\bar{z}={|z|^2}\), gdzie z=a+bi \(|z|=\sqrt{{a^2}+{b^2}}\)</p>
    <br/>
    <p>\(|z|=\sqrt{{a^2}+{b^2}}\) nazywamy modułem liczby z.</p>
    <br/>
    <p>W przykładach obliczymy moduł liczby z:</p>
    <p>1)&nbsp;z=8+3i</p>
    <p>\(|z|=\sqrt{{8^2}+{3^2}}=\sqrt{73}\)</p><br/>
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

class LiczbyZespolone2 extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  LiczbyZespolone2(
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
              LiczbyZespolone2Tekst.rownanie,
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
