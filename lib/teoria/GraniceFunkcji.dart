import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class GraniceFunkcjiTekst {

  static TeXViewWidget quadraticEquation =
  _teXViewWidget(r"<h1>Granice funkcji</h1>", r"""
    <h2>Definicja granicy funkcji w punkcie x=c w sensie Cauchy'ego</h2>
    <h2>Granice lewostronna</h2>
    <p>Jeżeli granicą lewostronną funkcji f(x) jest liczba g w punkcie c to możemy ją zapisać:</p>
    <p>\(\lim\limits_{x \rightarrow {c-0}} f(x)=g\)</p>
    <p>, jeśli tylko dla każdego &#949;&#62;0 istanieje taka liczba, że &#948;&#62;0, żeby </p>
    <p>\(|f(x)-g|&#60;\epsilon\)</p> &nbsp;dla &nbsp;c-&#948;&#60;x&#60;c.</p>
    <p>Jeżeli granica lewostronna znajduje się w punkcie x=0 to zapisujemy ją \(\lim\limits_{x \rightarrow 0} f(x)\)</p>
    <p>Trzeba również zauważyć, że jeśli granica lewostronna ma istnieć, to funkcja powinna być określona w pewnym przedziale
      otwartym, którego końcem jest liczba c.</p>
    <p>Za to dla x=c lub x&#62;c funkcja może być nieokreślona.</p>

    <br/><br/>
    <p>+&#8734; jest lewostronną granicą funkcji f(x) w punkcie x=c</p>
    <p>\(\lim\limits_{x \rightarrow {c-0}} f(x)=+&#8734;\)</p>
    <p>, jeśli dla każdej liczby M&#62;0 istnieje taka liczba &#948;&#62;0, że</p>
    <p>f(x)&#62;M &nbsp;dla &nbsp;c-&#948;&#60;x&#60;c</p>
    <br/>

    <p>-&#8734; jest lewostronną granicą funkcji f(x) w punkcie x=c</p>
    <p>\(\lim\limits_{x \rightarrow {c-0}} f(x)=-&#8734;\)</p>
    <p>, jeśli dla każdej liczby M&#62;0 istnieje taka liczba &#948;&#62;0, że</p>
    <p>f(x)&#60;-M &nbsp;dla &nbsp;c-&#948;&#60;x&#60;c</p>

    <br/><br/>

    <p>Z granicą prawostronną jest podobnie(do poprawy tutaj)</p>

    </p>
			
			""");

  /*
 <br/><br/>

    <p>Jeżeli za to chcemy zapisać, że liczba g jest granicą funkcji f(x) w punkcie x=c to:</p>
    <p>\(\lim\limits_{x \rightarrow c} f(x)=g\).</p>
    <br/>
    <h2>Twierdzenia o granicach:</h2>
    <p>\(\lim\limits_{x \rightarrow c} f(x)&#177;g(x)=\lim\limits_{x \rightarrow c} f(x) &#177; \lim\limits_{x \rightarrow c} g(x)\)</p>
    <p>\(\lim\limits_{x \rightarrow c} f(x){\cdot}g(x)=\lim\limits_{x \rightarrow c} f(x) {\cdot} \lim\limits_{x \rightarrow c} g(x)\)</p>
    <p>\(\lim\limits_{x \rightarrow c} f(x)/g(x)=\lim\limits_{x \rightarrow c} f(x)/\lim\limits_{x \rightarrow c} g(x)\)
      &nbsp;oraz&nbsp; \(\lim\limits_{x \rightarrow c} g(x)&#8800;0\)
    </p>
    <p>Dla granic lewostronnych musimy zastąpić x-&#62;c symbolem x-&#62;c-0, a dla granic prawostronnych symbolem x-&#62;c+0.</p>
    <br/><br/>

    <h2>Ciągłość funkcji</h2>
    <p>Mówimy, że funkcja f(x) jest ciągła w punkcie x=c, jeżeli istnieje granica \(\lim\limits_{x \rightarrow c} f(x)\)
      i jest ona równa f(c).</p>
    <p>Możemy również wypisać twierdzenia:</p>
    <p>Suma dwóch funkcji ciągłych w punkcie x=c jest funkcją ciągłą w tym punkcie.</p>
    <p>Iloczyn dwóch funkcji ciągłych w punkcie x=c jest funkcją ciągłą w tym punkcie.</p>
    <p>Iloraz dwóch funkcji ciągłych w punkcie x=c (dzielnik jest różny od zera)
      jest funkcją ciągłą w tym punkcie.
    </p>
    <p>
      Funkcja potęgowa x_a, (gdzie a to dowolna stała) jest określona i ciągła dla wartości x&#62;0.
    </p>
    <p>Funkcja wykładnicza a<sup><small>x</small></sup> jest ciągła dla wszystkich wartości x.</p>
    <p>Funkcja logarytmiczna log<sub><small>a</small></sub>x, (a&#62;0, a&#8800;1) jest ciągła
      dla x&#62;0.
    </p>
    <p>Funkcje sinus i cosinus są ciągłe dla wszystkich wartości x.</p>
    <p>Funkcja tangens jest ciągła dla wszystkich wartości x, z wyjątkiem x=\({\frac 1 2} (2k+1){\pi}\), (k&#8714; C).</p>
    <p>Funkcja tangens jest ciągła dla wszystkich wartości x, z wyjątkiem
      x=k&pi;, (k&#8714; C).

  */

  static TeXViewWidget _teXViewWidget(String title, String body) {
    return TeXViewColumn(
        style: TeXViewStyle(
            margin: TeXViewMargin.all(10),
            padding: TeXViewPadding.all(10),
            borderRadius: TeXViewBorderRadius.all(10),
            border: TeXViewBorder.all(TeXViewBorderDecoration(
                borderWidth: 2,
                borderStyle: TeXViewBorderStyle.Groove,
                borderColor: Colors.green))),
        children: [
          TeXViewDocument(title,
              style: TeXViewStyle(
                  padding: TeXViewPadding.all(10),
                  borderRadius: TeXViewBorderRadius.all(10),
                  textAlign: TeXViewTextAlign.Center,
                  width: 250,
                  margin: TeXViewMargin.zeroAuto(),
                  backgroundColor: Colors.green)),
          TeXViewDocument(body,
              style: TeXViewStyle(margin: TeXViewMargin.only(top: 10)))
        ]);
  }
}

class GraniceFunkcji extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  GraniceFunkcji(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text("TeXViewDocument"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              GraniceFunkcjiTekst.quadraticEquation,
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
