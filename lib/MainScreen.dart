import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matma_go/MatematykaKalkulator.dart';
import 'package:matma_go/Teoria.dart';
import 'package:matma_go/StronaGlowna.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int index=1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            title: Text('Teoria'),
            icon: Icon(Icons.tv),
          ),
          BottomNavigationBarItem(
            title: Text('Strona główna'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Kalkulatory'),
            icon: Icon(Icons.book),
          ),
        ],
        selectedItemColor: Colors.grey[200],
        unselectedItemColor: Colors.grey[700],
        elevation: 0,
        onTap: (int index){
          setState(() {
            this.index=index;
          });
        }
      ),
      backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        children: <Widget>[
          Teoria(),
          StronaGlowna(),
          MatematykaKalkulator(),
        ],
        index: index,
      ),
    );
  }
}