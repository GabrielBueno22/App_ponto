import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SincronizacaoScreen extends StatefulWidget {
  @override
  _SincronizacaoScreenState createState() => _SincronizacaoScreenState();
}

class _SincronizacaoScreenState extends State<SincronizacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sincronização"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Deseja sincronizar os dados do aplicativo com o sistema OnSuite?",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: const Color(0xFFfa7d09)),
                    child: FlatButton(
                      child: Text(
                        "Sincronizar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: null,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: const Color(0xFFfa7d09)),
                    child: FlatButton(
                      child: Text(
                        "Não agora",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              )
            ],
          ),
        ));
  }
}
