import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/perfil_controller.dart';
import '../widgets/text_form.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final controller = GetIt.I.get<PerfilController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFfa7d09),
                        const Color(0xFFff4301),
                      ], // whitish to gray
                      tileMode: TileMode
                          .repeated // repeats the gradient over the canvas
                      ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                    ),
                    Icon(
                      Icons.person_pin,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.3,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Gabriel",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              ),
              Observer(builder: (_) {
                return Container(
                  margin: EdgeInsets.only(left: 15, right: 5),
                  child: WidgetTextForm(
                    value: controller.nome,
                    //error: controller.nomeVazio,
                    text: "Nome",
                    onChanged: controller.setNome,
                    enabled: false,
                    icon: null,
                    numero: false,
                  ),
                );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: Observer(builder: (_) {
                  return WidgetTextForm(
                    value: controller.email,
                    text: "Email",
                    enabled: true,
                    onChanged: controller.setEmail,
                    numero: false,
                    icon: null,
                  );
                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: Observer(builder: (_) {
                  return WidgetTextForm(
                    value: controller.senha,
                    //error: controller.telefoneVazio,
                    text: "Senha",
                    numero: true,
                    enabled: true,
                    onChanged: controller.setSenha,
                    icon: null,
                  );
                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Notificações"),
                    Observer(builder: (_) {
                      return Switch(
                        onChanged: (bool value) {
                          controller.setCheck();
                        },
                        value: controller.check,
                      );
                    })
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Observer(builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: controller.valoresAlterados
                        ? const Color(0xFFfa7d09)
                        : Colors.grey[600],
                  ),
                  child: FlatButton(
                    child: Text(
                      "Confirmar alterações",
                      style: TextStyle(
                          color: controller.valoresAlterados
                              ? Colors.white
                              : Colors.grey),
                    ),
                    onPressed: controller.valoresAlterados
                        ? () {
                            navigator.navigateTo('/tabBar');
                          }
                        : null,
                  ),
                );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
