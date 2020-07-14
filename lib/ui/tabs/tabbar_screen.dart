import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/ui/consulta/consultar_horas_screen.dart';
import 'package:flutter_mobile/ui/menu/menu_screen.dart';
import 'package:flutter_mobile/ui/ponto/home_screen.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ConsultarHorasScreen(),
    MenuScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.085,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFfa7d09),
                const Color(0xFFff4301),
              ], // whitish to gray
              tileMode:
                  TileMode.repeated // repeats the gradient over the canvas
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _onItemTapped(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          Text(
                            "Ponto",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ))),
            Container(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          _onItemTapped(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.receipt,
                              color: Colors.white,
                            ),
                            Text(
                              "Relatórios",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        )))),
            Container(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          _onItemTapped(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                            Text(
                              "Menu",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ))))
          ],
        ),
      ),
    );
  }
}
