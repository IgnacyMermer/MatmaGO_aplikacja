import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class CiagiNieskTekst {

  static TeXViewWidget rownanie =
  _teXViewWidget(r"<h1>Ciągi nieskończone</h1>", r"""
    <p>Ciąg nieskończony to ciąg, który nie ma określonego wyrazu ostatniego, znaczy to, że każdej liczbie naturalnej
          n odpowiada wyraz tego ciągu.</p>
          <br/>
          <p>Ciąg nieskończony ma granicę g, jeżeli dla każdej liczby dodatniej ϵ istnieje w ciągu takie miejsce N,
              że dla każdego n&#8805;N zachodzi nierówność:</p>
          <p>|\(a_n\)-g|&#60;ϵ</p>
          <p>Zapis, że ciąg dąży do granicy g wygląda następująco:</p>
          <p>\(u_n&nbsp;to&nbsp;g\), gdy \({n \rightarrow \infty}\) lub \({\lim\limits_{n \rightarrow \infty}u_n=\infty}\)
          </p>
          <br/><br/>

          <p>Ciąg nieskończony, który ma granicę skończoną nazywamy ciągiem zbieżnym.</p>
          <p>Jeżeli ciąg nie ma granicy skończonej to nazywamy go ciągiem rozbieżnym. Stosujemy tutaj pojęcie dolnej i 
          górnej granicy, które są odpowiednio najmniejszą i największą granicą danego ciągu.</p>
          <br/>

          <p>Ciąg dąży do plus nieskończoności, jeżeli dla każdej liczby z&#62;0 można znaleźć w ciągu taki wyraz
              na pozycji n, dla którego \(u_n\)&#62;z</p>

          <p>Ciąg dąży do minus nieskończoności, jeżeli dla każdej liczby z&#60;0 można znaleźć w ciągu taki wyraz na
              pozycji n, dla którego \(u_n\)&#60;z</p>
          <br/>
          <p>Mamy jednak wyjątki, ponieważ nie każdy ciąg nieskończony ma granicę. Np. ciąg 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, ...
              nie ma granicy.</p>
			
			""");

  /*
  <h3>Własności:</h3>
          <p>1) Jeżeli ciąg \(a_n\) ma granicę a i ciąg \(b_n\) ma granicę b to ciąg
              &#123;\(a_n\) + \(b_n\)&#125; ma granicę a+b.
          </p>

          <p>2) Jeżeli ciąg \(a_n\) ma granicę ai ciąg \(b_n\) ma granicę \(b\) oraz żaden z wyrazów ciągu \(b_n\) nie równa
              się 0 i granica b nie równa się 0 to ciąg ilorazów \({a_n/b_n}\) ma granicę a/b.
          </p>

          <p>3) Jeżeli licznik ułamka jest wielomianem względem zmiennej naturalnej n, której stopień jest
              wyższy niż stopnień mianownika, to gdy \({n \rightarrow \infty}\) wartość ułamka dąży do plus/minus nieskończoności.
          </p>

          <p>
             \({\lim\limits_{n \rightarrow \infty}(1+{\frac 1 n})^n}\) = e, gdzie n jest dowolnym wyrazem ciągu \(a_n\)
              (n&#8800;0), e - liczba Eulera (2,71828...).
          </p>
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

class CiagiNiesk extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  CiagiNiesk(
      {this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text("Ciągi nieskończone"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewColumn(children: [
              CiagiNieskTekst.rownanie,
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
