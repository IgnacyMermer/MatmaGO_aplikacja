import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class NierownosciTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Nierówności stopnia pierwszego z jedną niewiadomą</h1>", r"""
    <h4>Mówimy, że mamy nierówność stopnia n, gdy połączymy dwa wielomiany, gdzie jeden jest stopnia n, a drugi
        co najwyżej stopnia n.</h4><br/>
    <p>Nierówność stopnia pierwszego nazywamy nierównością liniową, a nierówność stopnia drugiego nierównością kwadratową.</p>
    <p>Nierówność ze znakiem &#60; lub &#62; nazywamy nierównością ostrą, a ze znakiem &#8804; lub &#8805; nazywamy nierównością
    słabą.</p>

    <br/><br/>

    <p>Dwie nierówności nazywamy nierównościami równoważnymi, jeżeli mają takie same rozwiązanie. Możemy również,
        wtedy wywnioskować, że:</p>
    <ul>
        <li>Jeżeli do obydwu stron nierówności dodamy ten sam wielomian, to otrzymamy nierówność równoważną.</li>
        <li>Jeżeli obydwie strony nierówności pomnożymy przez liczbę dodatnią, to otrzymamy nierówność równoważną.</li>
        <li>Jeżeli obydwie strony nierówności pomnożymy przez liczbę ujemną, to musimy zmienić znak nierówności, żeby
        otrzymać nierówność równoważną.</li>
    </ul>

    <br/><br/>

    <h2>Równania i nierówności modułowe</h2>
    <p>Jeżeli niewiadoma występuje pod wartością bezwzględną (tj. znakiem modułu) to możemy zapisać następujące zależności:</p>
    <p>a - oznacza dowolną liczbę rzeczywistą, b - oznacza dowolną liczbę dodatnią.</p>
    <p>1)&nbsp;&nbsp;(|x-a|&#62;b &#8743; (b&#62;0)) &#8801; ((x&#60;a-b)&#8744;(x&#62;a+b)),</p>
    <p>2)&nbsp;&nbsp;((|x-a|&#60;b &#8743; (b&#62;0)) &#8801; (a-b&#60;x&#60;a+b).</p>

    <br/><br/>
    <p>Przykład:</p>
    <p>Nierówność: |x+4|>3 jest równoważna alternatywie nierówności:</p>
    <p>1)&nbsp;&nbsp;(|x-(-4)|&#62;3 &#8743; (3&#62;0)) &#8801; ((x&#60;(-4)-3)&#8744;(x&#62;(-4)+3)),</p>
    <p>x&#60;-7 &#8744; x&#62;-1</p>
			
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

class Nierownosci extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  Nierownosci(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Nierówności"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              NierownosciTekst.rownanie,
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
